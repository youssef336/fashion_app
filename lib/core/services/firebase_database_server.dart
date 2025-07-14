import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion/core/services/main/database_service.dart';

class FirebaseDatabaseServer implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var result = await firestore.collection(path).doc(documentId).get();
      return result.data();
    } else {
      var result = await firestore.collection(path).get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<Stream> getStreamData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      return firestore.collection(path).doc(documentId).snapshots();
    } else {
      var result = firestore.collection(path).snapshots();
      return result.map((event) => event.docs.map((e) => e.data()));
    }
  }
}
