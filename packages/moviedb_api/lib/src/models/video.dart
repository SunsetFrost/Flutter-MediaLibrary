import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  Video(
    this.adult,
    this.genreIds,
    this.videoId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  );

  final bool adult;
  final List<int> genreIds;
  final int videoId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final num popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
