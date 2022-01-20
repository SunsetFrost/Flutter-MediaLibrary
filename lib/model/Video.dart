// import 'package:equatable/equatable.dart';
import 'package:media_library/model/Card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Video.g.dart';

@JsonSerializable()
class Video extends Card {
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

  Video({
    required this.adult,
    required this.genreIds,
    required this.videoId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(id: videoId.toString(), name: title, desc: posterPath);

  // @override
  // List<Object> get props => [
  //       adult,
  //       genreIds,
  //       id,
  //       originalLanguage,
  //       originalTitle,
  //       overview,
  //       popularity,
  //       posterPath,
  //       releaseDate,
  //       title,
  //       video,
  //       voteAverage,
  //       voteCount,
  //     ];

  // Video.fromJson(Map<String, dynamic> json)
  //     : adult = json['adult'],
  //       genreIds = json['genre_ids'].cast<int>(),
  //       id = json['id'],
  //       originalLanguage = json['original_language'],
  //       originalTitle = json['original_title'],
  //       overview = json['overview'],
  //       popularity = json['popularity'],
  //       posterPath = json['poster_path'] ?? '',
  //       releaseDate = json['release_date'],
  //       title = json['title'],
  //       video = json['video'],
  //       voteAverage = json['vote_average'].toDouble(),
  //       voteCount = json['vote_count'];

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['adult'] = this.adult;
  //   data['genre_ids'] = this.genreIds;
  //   data['id'] = this.id;
  //   data['original_language'] = this.originalLanguage;
  //   data['original_title'] = this.originalTitle;
  //   data['overview'] = this.overview;
  //   data['popularity'] = this.popularity;
  //   data['poster_path'] = this.posterPath;
  //   data['release_date'] = this.releaseDate;
  //   data['title'] = this.title;
  //   data['video'] = this.video;
  //   data['vote_average'] = this.voteAverage;
  //   data['vote_count'] = this.voteCount;
  //   return data;
  // }

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
