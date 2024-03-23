import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static final CollectionReference _residentialRef =
      FirebaseFirestore.instance.collection('housingdetails');

  static CollectionReference get residentialRef => _residentialRef;

  static Future<List<QueryDocumentSnapshot>> get fetchresidential =>
      _fetchresidential();

  static Future<List<QueryDocumentSnapshot>> _fetchresidential() async {
    try {
      var categories = await _residentialRef.get();
      return categories.docs;
    } catch (e) {
      // print(e);
      rethrow;
    }
  }
}
