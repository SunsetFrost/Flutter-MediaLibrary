import 'package:equatable/equatable.dart';
import 'package:library_respository/library_repository.dart';

class CacheKey extends Equatable {
  const CacheKey(this.type, this.params);

  final APIType type;
  final Map<String, dynamic> params;

  @override
  List<Object> get props => [type, params];
}

typedef CacheItem<T> = T;

class LibraryCache {
  final _cache = <CacheKey, CacheItem>{};

  CacheItem? get(CacheKey key) => _cache[key];

  void set(CacheKey key, CacheItem item) => _cache[key] = item;

  bool contains(CacheKey key) => _cache.containsKey(key);

  void remove(CacheKey key) => _cache.remove(key);
}
