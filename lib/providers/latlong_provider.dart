import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pribumi_apps/models/residential_model.dart';
import 'package:pribumi_apps/services/database_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'latlong_provider.g.dart';

@riverpod
Future<List<Map<String, dynamic>>> latLong(LatLongRef ref) async {
  final List<Map<String, dynamic>> listLatLong = [];

  List<QueryDocumentSnapshot<Object?>> destinationSnapshot =
      await Database.fetchresidential;

  var residentials = destinationSnapshot.map(
    (e) => ResidentialModel.fromJSON(e.id, e.data() as Map<String, dynamic>),
  );

  for (var value in residentials) {
    LatLng latLang = LatLng(value.latitude!, value.longitude!);
    String title = value.name ?? '';
    listLatLong.add(
      {'position': latLang, 'title': title},
    );
  }

  return listLatLong;
}
