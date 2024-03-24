import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'position_provider.g.dart';

@riverpod
Stream<Position> position(PositionRef ref) async* {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  yield position;
}
