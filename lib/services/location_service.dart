import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  static chekPermission(BuildContext context) async {
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

  static Future<Position?> getCurrentPosition() async {
    try {
      LocationPermission check = await Geolocator.checkPermission();

      if (check == LocationPermission.whileInUse ||
          check == LocationPermission.always) {
        // Get Position
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        return position;
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> getAddress() async {
    try {
      // Get location
      Position? position = await getCurrentPosition();
      if (position != null) {
        // Get placemark list from cordinates
        List<Placemark> placemarkList = await placemarkFromCoordinates(
            position.latitude, position.longitude);

        // Get placemark
        Placemark placemark = placemarkList[0];

        // Get addrress
        String place =
            '${placemark.name}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea},';

        return place;
      }

      return 'alamat tidak ditemukan';
    } catch (e) {
      rethrow;
    }
  }
}
