import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  Album(
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.totalTracks,
    this.type,
    this.uri,
  );

  @JsonKey(name: 'album_type')
  final String albumType;

  final List<Artists> artists;

  @JsonKey(name: 'available_markets')
  final List<String> availableMarkets;

  final String href;
  final String id;
  final List<Images> images;
  final String name;
  final String releaseDate;

  @JsonKey(name: 'total_tracks')
  final int totalTracks;
  final String type;
  final String uri;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

@JsonSerializable()
class Artists {
  Artists(
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  );
  final String href;
  final String id;
  final String name;
  final String type;
  final String uri;

  factory Artists.fromJson(Map<String, dynamic> json) =>
      _$ArtistsFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);
}

@JsonSerializable()
class Images {
  Images(
    this.height,
    this.url,
    this.width,
  );
  final int height;
  final String url;
  final int width;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}
