class VideoInfo {
  VideoInfo({
    required this.adult,
    required this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  late final String backdropPath;
  late final Null belongsToCollection;
  late final int budget;
  late final List<Genres> genres;
  late final String homepage;
  late final int id;
  late final String imdbId;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final List<ProductionCompanies> productionCompanies;
  late final List<ProductionCountries> productionCountries;
  late final String releaseDate;
  late final int revenue;
  late final int runtime;
  late final List<SpokenLanguages> spokenLanguages;
  late final String status;
  late final String tagline;
  late final String title;
  late final bool video;
  late final double voteAverage;
  late final int voteCount;

  VideoInfo.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = null;
    budget = json['budget'];
    genres = List.from(json['genres']).map((e) => Genres.fromJson(e)).toList();
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    productionCompanies = List.from(json['production_companies'])
        .map((e) => ProductionCompanies.fromJson(e))
        .toList();
    productionCountries = List.from(json['production_countries'])
        .map((e) => ProductionCountries.fromJson(e))
        .toList();
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    spokenLanguages = List.from(json['spoken_languages'])
        .map((e) => SpokenLanguages.fromJson(e))
        .toList();
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['belongs_to_collection'] = belongsToCollection;
    _data['budget'] = budget;
    _data['genres'] = genres.map((e) => e.toJson()).toList();
    _data['homepage'] = homepage;
    _data['id'] = id;
    _data['imdb_id'] = imdbId;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;
    _data['production_companies'] =
        productionCompanies.map((e) => e.toJson()).toList();
    _data['production_countries'] =
        productionCountries.map((e) => e.toJson()).toList();
    _data['release_date'] = releaseDate;
    _data['revenue'] = revenue;
    _data['runtime'] = runtime;
    _data['spoken_languages'] = spokenLanguages.map((e) => e.toJson()).toList();
    _data['status'] = status;
    _data['tagline'] = tagline;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}

class Genres {
  Genres({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class ProductionCompanies {
  ProductionCompanies({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });
  late final int id;
  late final String logoPath;
  late final String name;
  late final String originCountry;

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['logo_path'] = logoPath;
    _data['name'] = name;
    _data['origin_country'] = originCountry;
    return _data;
  }
}

class ProductionCountries {
  ProductionCountries({
    required this.iso_3166_1,
    required this.name,
  });
  late final String iso_3166_1;
  late final String name;

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso_3166_1 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['iso_3166_1'] = iso_3166_1;
    _data['name'] = name;
    return _data;
  }
}

class SpokenLanguages {
  SpokenLanguages({
    required this.englishName,
    required this.iso_639_1,
    required this.name,
  });
  late final String englishName;
  late final String iso_639_1;
  late final String name;

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso_639_1 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['english_name'] = englishName;
    _data['iso_639_1'] = iso_639_1;
    _data['name'] = name;
    return _data;
  }
}
