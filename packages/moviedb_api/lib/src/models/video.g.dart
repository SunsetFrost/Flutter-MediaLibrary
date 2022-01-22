// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      json['id'] as int,
      json['overview'] as String,
      json['title'] as String,
      json['popularity'] as num,
      json['video'] as bool,
      json['adult'] as bool?,
      json['release_date'] as String,
      (json['vote_average'] as num).toDouble(),
      json['vote_count'] as int,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['original_language'] as String?,
      json['original_title'] as String?,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'overview': instance.overview,
      'title': instance.title,
      'popularity': instance.popularity,
      'video': instance.video,
      'adult': instance.adult,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
    };
