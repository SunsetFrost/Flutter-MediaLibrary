import 'package:library_respository/library_repository.dart';

class CacheKey {
  const CacheKey(this.type, this.params);

  final APIType type;
  final Map<String, dynamic> params;
}

typedef CacheItem<T> = T;

class LibraryCache {
  final _cache = <CacheKey, CacheItem>{};

  CacheItem? get(CacheKey key) => _cache[key];

  void set(CacheKey key, CacheItem item) => _cache[key] = item;
}
