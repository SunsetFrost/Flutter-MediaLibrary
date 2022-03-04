import 'package:library_repository/library_repository.dart';

class LibraryRepository {
  LibraryRepository({required baseUrl, required this.type})
      : apiClient = CommonAPI.fromLibrary(baseUrl, type),
        cache = LibraryCache();

  final CommonAPI apiClient;
  final LibraryCache cache;
  final APIType type;

  Future<List<dynamic>> getPopularList(Map<String, dynamic> params) async {
    final cacheKey = CacheKey(type, params);
    final cacheResult = cache.get(cacheKey);
    if (cacheResult != null) {
      return cacheResult;
    }
    final result = await apiClient.getPopularList(params);
    cache.set(cacheKey, result);
    return result;
  }

  Future<List<dynamic>> getSearchList(Map<String, dynamic> params) async {
    final cacheKey = CacheKey(type, params);
    final cacheResult = cache.get(cacheKey);
    if (cacheResult != null) {
      return cacheResult;
    }
    final result = await apiClient.getSearchList(params);
    cache.set(cacheKey, cacheResult);
    return result;
  }

  Future<dynamic> getDetail(String id) async {
    final keyParams = {'id': id};
    final cacheKey = CacheKey(type, keyParams);
    final cacheResult = cache.get(cacheKey);
    if (cacheResult != null) {
      return cacheResult;
    }
    final result = await apiClient.getDetail(id);
    cache.set(cacheKey, cacheResult);
    return result;
  }
}
