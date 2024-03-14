import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pribumi_apps/data/data_resedential.dart';

class MapService {
  static Future<List<Map<String, dynamic>>> getLatLong() async {
    List<Map<String, dynamic>> listLatLang = [];

    for (var residential in DataResidential.listResedential) {
      LatLng latLang = LatLng(residential.latitude!, residential.longitude!);
      String title = residential.name!;
      listLatLang.add(
        {'position': latLang, 'title': title},
      );
    }

    return listLatLang;
  }

  static Marker customMarker(LatLng e, String title) {
    return Marker(
      markerId: MarkerId(
        e.hashCode.toString(),
      ),
      position: e,
      infoWindow: InfoWindow(title: title),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
  }
}
