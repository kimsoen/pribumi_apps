import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pribumi_apps/models/residential_model.dart';
import 'package:pribumi_apps/providers/position_provider.dart';
import 'package:pribumi_apps/services/database_service.dart';
import 'package:pribumi_apps/services/distance_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'residential_provider.g.dart';

@Riverpod(keepAlive: true)
class Residential extends _$Residential {
  // Ini wadah list kosong untuk fungsi filter
  List<ResidentialModel> _originalResidentials = [];

  @override
  FutureOr<List<ResidentialModel>> build() async {
    // Buat wadah list kosong terlebih dahulu
    List<ResidentialModel> residentials = [];

    // Ini fungsi untuk update distance atau jarak pada firestore di jalankan sebelum mengambil data
    // await updateDistanceFirestore();

    // Ambil data dari firestore
    List<QueryDocumentSnapshot> residentialSnapshot =
        await Database.fetchresidential;

    // Looping destinationsSnapshot
    for (var residential in residentialSnapshot) {
      // Tambahkan data yang telah di looping ke list kosong yang telah di buat di atas
      residentials.add(
        // Parsing data JSON ke model dengan fungsi fromJSON
        ResidentialModel.fromJSON(
            residential.id, residential.data() as Map<String, dynamic>),
      );
    }

    // Ini fungsi untuk update distance atau jarak pada lokal state
    List<ResidentialModel> listResidential =
        await updateDistanceLocal(residentials);

    // Isi list _originalResidentials dengan list residentials
    _originalResidentials = listResidential;
    return listResidential;
  }

  Future<void> updateDistanceFirestore() async {
    try {
      // Ambil data dari firestore
      List<QueryDocumentSnapshot<Object?>> destinationSnapshot =
          await Database.fetchresidential;

      // Parsing data JSON ke model dengan fungsi fromJSON
      var residentials = destinationSnapshot.map(
        (e) =>
            ResidentialModel.fromJSON(e.id, e.data() as Map<String, dynamic>),
      );

      // Looping residential
      for (var value in residentials) {
        // Ambil data lokasi atau posisi
        Position position = await ref.watch(positionProvider.future);

        // Hitung jarak dengan fungsi distanceBetween
        double result = DistanceService.distanceBetween(position.latitude,
            position.longitude, value.latitude!, value.longitude!);

        // Hasil perhitungan di bagi 1000 karena akan di tampilkan dalam satuan (Km)
        double distance = result;

        // Update data distnace/jarak pada firestore dengan data jarak yang telah dihitung tersebut
        await Database.residentialRef.doc(value.id).update({
          'distance': distance,
        });
      }
    } catch (e) {
      debugPrint('ini error update $e');
      rethrow;
    }
  }

  Future<List<ResidentialModel>> updateDistanceLocal(
      List<ResidentialModel> residentials) async {
    List<ResidentialModel> listResidential = [];
    try {
      // Looping residential
      for (var value in residentials) {
        // Ambil data lokasi atau posisi
        Position position = await ref.watch(positionProvider.future);

        // Hitung jarak dengan fungsi distanceBetween
        double result = DistanceService.distanceBetween(position.latitude,
            position.longitude, value.latitude!, value.longitude!);

        // Hasil perhitungan di bagi 1000 karena akan di tampilkan dalam satuan (Km)
        double distance = result / 1000;

        // Update ResidentialModel
        ResidentialModel data = ResidentialModel(
          id: value.id,
          image: value.image,
          photos: value.photos,
          name: value.name,
          address: value.address,
          description: value.description,
          access: value.access,
          distance: distance,
          latitude: value.latitude,
          longitude: value.longitude,
        );

        listResidential.add(data);
      }

      return listResidential;
    } catch (e) {
      debugPrint('ini error update distance $e');
      rethrow;
    }
  }

  void filterResidentials(String nameResidential) {
    // Create result variable
    List<ResidentialModel> result = [];

    // Condition nameResidential is empety
    if (nameResidential.isEmpty) {
      result = _originalResidentials;

      // Condition nameResidential not empety
    } else {
      result = _originalResidentials
          .where(
            (element) => element.name.toString().toLowerCase().contains(
                  nameResidential.toLowerCase(),
                ),
          )
          .toList();
    }

    state = AsyncData(result);
  }
}
