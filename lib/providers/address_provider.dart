import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'address_provider.g.dart';

@riverpod
Future<String?> address(AddressRef ref, {required Position? position}) async {
  if (position != null) {
    List<Placemark> placemarkList =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark placemark = placemarkList[0];

    String place =
        '${placemark.name}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea},';

    return place;
  }
  return null;
}
