import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pribumi_apps/providers/latlong_provider.dart';

class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Marker customMarker(LatLng e, String title) {
      return Marker(
        markerId: MarkerId(
          e.hashCode.toString(),
        ),
        position: e,
        infoWindow: InfoWindow(title: title),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      );
    }

    return Scaffold(
        body: ref.watch(latLongProvider).when(
              data: (data) => GoogleMap(
                initialCameraPosition: const CameraPosition(
                    target: LatLng(-7.335628465649583, 108.2153687032602),
                    zoom: 12),
                markers: data
                    .map(
                      (e) => customMarker(
                        e['position'],
                        e['title'],
                      ),
                    )
                    .toSet(),
              ),
              error: (error, stackTrace) => const GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(-7.335628465649583, 108.2153687032602),
                    zoom: 12),
              ),
              loading: () => const GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(-7.335628465649583, 108.2153687032602),
                    zoom: 12),
              ),
            ));
  }
}
