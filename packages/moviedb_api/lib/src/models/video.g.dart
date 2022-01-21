// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      json['adult'] as bool,
      (json['genreIds'] as List<dynamic>).map((e) => e as int).toList(),
      json['videoId'] as int,
      json['originalLanguage'] as String,
      json['originalTitle'] as String,
      json['overview'] as String,
      json['popularity'] as num,
      json['posterPath'] as String,
      json['releaseDate'] as String,
      json['title'] as String,
      json['video'] as bool,
      (json['voteAverage'] as num).toDouble(),
      json['voteCount'] as int,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'adult': instance.adult,
      'genreIds': instance.genreIds,
      'videoId': instance.videoId,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
