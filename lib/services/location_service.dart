import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  chekPermission(BuildContext context) async {
    LocationPermission check = await Geolocator.checkPermission();
    if (check == LocationPermission.denied ||
        check == LocationPermission.deniedForever) {
      if (context.mounted) {
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            title: const Center(child: Text('Ijin Lokasi ')),
            content: const Text(
                'Ijin lokasi belum di aktifkan, silakan aktifkan terlebih dahulu.'),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    await Geolocator.requestPermission();
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('OK'))
            ],
          ),
        );
      }
    }
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

  Future<String> getAddress() async {
    try {
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

      return place;
    } catch (e) {
      rethrow;
    }
  }
}
