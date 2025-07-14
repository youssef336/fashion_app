abstract class DatabaseService {
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });
  Future<Stream> getStreamData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });
}
