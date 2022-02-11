import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  Video(
    this.id,
    this.overview,
    this.title,
    this.popularity,
    this.video,
    this.adult,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
  );

  final int id;
  final String overview;
  final String title;
  final num popularity;
  final bool video;
  final bool? adult;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  @JsonKey(name: 'poster_path', fromJson: imageToMiddleSizeImagePath)
  final String posterPath;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  static String imageToMiddleSizeImagePath(String image) {
    const String videoImageUrl = 'https://image.tmdb.org/t/p/w154/';
    return videoImageUrl + image;
  }
}
