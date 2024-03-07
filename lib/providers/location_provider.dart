import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_provider.g.dart';

@riverpod
Future<Position?> position(PositionRef ref) async {
  LocationPermission permissionGranted = await Geolocator.checkPermission();
  if (permissionGranted == LocationPermission.always ||
      permissionGranted == LocationPermission.whileInUse) {
    // Get Position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }
  return null;
}
