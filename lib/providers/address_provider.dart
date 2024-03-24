import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pribumi_apps/providers/position_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'address_provider.g.dart';

@riverpod
Future<String> address(AddressRef ref) async {
  Position position = await ref.watch(positionProvider.future);

  List<Placemark> placemarkList =
      await placemarkFromCoordinates(position.latitude, position.longitude);

  Placemark placemark = placemarkList[0];

  String place =
      '${placemark.name}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea},';

  return place;
}
