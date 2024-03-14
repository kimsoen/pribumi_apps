import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pribumi_apps/services/map_service.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: MapService.getLatLong(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(-7.335628465649583, 108.2153687032602),
                  zoom: 12),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return GoogleMap(
              initialCameraPosition: const CameraPosition(
                  target: LatLng(-7.335628465649583, 108.2153687032602),
                  zoom: 12),
              markers: snapshot.data!
                  .map(
                    (e) => MapService.customMarker(
                      e['position'],
                      e['title'],
                    ),
                  )
                  .toSet(),
            );
          } else {
            return const GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(-7.335628465649583, 108.2153687032602),
                  zoom: 12),
            );
          }
        },
      ),
    );
  }
}
