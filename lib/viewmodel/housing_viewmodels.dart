import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pribumi_apps/services/distance_service.dart';

import '../controller/database_controller.dart';
import '../models/residential_model.dart';


class DestinationViewModel extends GetxController {
  final List<ResidentialModel> _destinations = [];

  List<ResidentialModel> _foundDestination = [];

  final RxString? _address = RxString('');

  bool _isLoading = false;

  final RxBool _loading = false.obs;

  bool get isLoading => _isLoading;

  RxBool get loading => _loading;

  RxString? get address => _address;

  List<ResidentialModel> get destinations => _destinations;

  List<ResidentialModel> get foundDestination => _foundDestination;

  set setFoundDestination(List<ResidentialModel> value) {
    _foundDestination = value;
  }

  Future<void> _getDestinations() async {
    _isLoading = true;

    // Fetching data from cloud firestore
    List<QueryDocumentSnapshot> residentialSnapshot =
        await Database.fetchresidential;

    // Looping destinationsSnapshot
    for (var residential in residentialSnapshot) {
      // Add data from destinationsSnapshot to destinations
      destinations.add(
        // Parsing JSON destination
        ResidentialModel.fromJson(
            residential.id as Map<String, dynamic>, residential.data() as Map<String, dynamic>),
      );
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      _isLoading = false;
    });

    update();
  }

  void filterDestination(String nameDestination) {
    _isLoading = true;

    // Create result variable
    List<ResidentialModel> result = [];

    // Condition nameDestination is empety
    if (nameDestination.isEmpty) {
      result = destinations;

      // Condition nameDestination not empety
    } else {
      result = destinations
          .where(
            (element) => element.name.toString().toLowerCase().contains(
                  nameDestination.toLowerCase(),
                ),
          )
          .toList();
    }

    setFoundDestination = result;

    _isLoading = false;
    update();
  }

  Future<Position> _getCurrentPosition() async {
    try {
      // Request Permission Location
      await Geolocator.requestPermission();

      // Get Position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      return position;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _getAddress() async {
    try {
      _loading.value = true;

      // Get location
      Position position = await _getCurrentPosition();

      // Get placemark list from cordinates
      List<Placemark> placemarkList =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      // Get placemark
      Placemark placemark = placemarkList[0];

      // Get addrress
      String place =
          '${placemark.name}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea},';

      // Initialize adrress
      address!.value = place;

      _loading.value = false;
    } catch (e) {
      rethrow;
    }
    update();
  }

  Future<void> _distanceInKm() async {
    try {
      _isLoading = true;

      // Get data from firestore
      List<QueryDocumentSnapshot<Object?>> destinationSnapshot =
          await Database.fetchresidential;

      // Parsing JSON destinationSnapshot
      var residential = destinationSnapshot.map(
        (e) =>
            ResidentialModel.fromJson(e.id as Map<String, dynamic>, e.data() as Map<String, dynamic>),
      );

      // Get location, Calculate distance between and update distance
      for (var value in residential) {
        Position position = await _getCurrentPosition();

        double result = DistanceService.distanceBetween(position.latitude,
            position.longitude, value.latitude!, value.longitude!);

        double distance = result / 1000;

        Database.residentialRef.doc(value.name).update({
          'distance': distance,
        });
      }

      _isLoading = false;
      update();
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> goToMap(String url) async {
  //   final linkUrl = url;
  //   try {
  //     if (await canLaunch(linkUrl)) {
  //       await launch(
  //         url,
  //       );
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  void onInit() {
    _getDestinations();
    setFoundDestination = destinations;
    _getAddress();
    _distanceInKm();
    super.onInit();
  }
}
