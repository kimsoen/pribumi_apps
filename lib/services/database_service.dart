import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static final CollectionReference _residentialRef =
      FirebaseFirestore.instance.collection('housingdetails');

  static CollectionReference get residentialRef => _residentialRef;

  static Future<List<QueryDocumentSnapshot>> get fetchresidential =>
      _fetchresidential();

  static Future<List<QueryDocumentSnapshot>> _fetchresidential() async {
    try {
      var snapshot = await _residentialRef.get();
      return snapshot.docs;
    } catch (e) {
      // print(e);
      debugPrint('ini error acces firestore $e');
      rethrow;
    }
  }
}
