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
      return await firestore.collection(path).doc(documentId).get();
    } else {
      var result = await firestore.collection(path).get();
      return result.docs.map((e) => e.data()).toList();
    }
  }
}
