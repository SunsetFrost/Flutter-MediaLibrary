import 'package:library_respository/library_repository.dart';
import 'package:common_api/common_api.dart';

class LibraryRepository {
  LibraryRepository({required baseUrl, required this.type})
      : apiClient = CommonAPI.fromLibrary(baseUrl, type);

  final CommonAPI apiClient;
  final APIType type;

  Future<List<T>> getPopularList<T>(Map<String, dynamic> params) async {}
  Future<List<T>> getSearchList<T>(Map<String, dynamic> params) async {}
  Future<T> getPopularList<T>(Map<String, dynamic> params) async {}
}
