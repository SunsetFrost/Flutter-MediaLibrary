// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      adult: json['adult'] as bool,
      genreIds:
          (json['genreIds'] as List<dynamic>).map((e) => e as int).toList(),
      videoId: json['videoId'] as int,
      originalLanguage: json['originalLanguage'] as String,
      originalTitle: json['originalTitle'] as String,
      overview: json['overview'] as String,
      popularity: json['popularity'] as num,
      posterPath: json['posterPath'] as String,
      releaseDate: json['releaseDate'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: json['voteCount'] as int,
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
