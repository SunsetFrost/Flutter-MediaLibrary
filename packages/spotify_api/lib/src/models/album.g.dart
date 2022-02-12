// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      json['album_type'] as String,
      (json['artists'] as List<dynamic>)
          .map((e) => Artists.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['available_markets'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      json['href'] as String,
      json['id'] as String,
      (json['images'] as List<dynamic>)
          .map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['name'] as String,
      json['releaseDate'] as String?,
      json['total_tracks'] as int?,
      json['type'] as String?,
      json['uri'] as String,
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'album_type': instance.albumType,
      'artists': instance.artists,
      'available_markets': instance.availableMarkets,
      'href': instance.href,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'releaseDate': instance.releaseDate,
      'total_tracks': instance.totalTracks,
      'type': instance.type,
      'uri': instance.uri,
    };

Artists _$ArtistsFromJson(Map<String, dynamic> json) => Artists(
      json['href'] as String,
      json['id'] as String,
      json['name'] as String,
      json['type'] as String,
      json['uri'] as String,
    );

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'uri': instance.uri,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      json['height'] as int,
      json['url'] as String,
      json['width'] as int,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'width': instance.width,
    };
