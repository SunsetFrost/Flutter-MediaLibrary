class Track {
  Track({
    required this.artists,
    required this.availableMarkets,
    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.isLocal,
    required this.name,
    required this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
  });
  late final List<Artists> artists;
  late final List<String> availableMarkets;
  late final int discNumber;
  late final int durationMs;
  late final bool explicit;
  late final ExternalUrls externalUrls;
  late final String href;
  late final String id;
  late final bool isLocal;
  late final String name;
  late final String previewUrl;
  late final int trackNumber;
  late final String type;
  late final String uri;

  Track.fromJson(Map<String, dynamic> json) {
    artists =
        List.from(json['artists']).map((e) => Artists.fromJson(e)).toList();
    availableMarkets =
        List.castFrom<dynamic, String>(json['available_markets']);
    discNumber = json['disc_number'];
    durationMs = json['duration_ms'];
    explicit = json['explicit'];
    externalUrls = ExternalUrls.fromJson(json['external_urls']);
    href = json['href'];
    id = json['id'];
    isLocal = json['is_local'];
    name = json['name'];
    previewUrl = json['preview_url'];
    trackNumber = json['track_number'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['artists'] = artists.map((e) => e.toJson()).toList();
    _data['available_markets'] = availableMarkets;
    _data['disc_number'] = discNumber;
    _data['duration_ms'] = durationMs;
    _data['explicit'] = explicit;
    _data['external_urls'] = externalUrls.toJson();
    _data['href'] = href;
    _data['id'] = id;
    _data['is_local'] = isLocal;
    _data['name'] = name;
    _data['preview_url'] = previewUrl;
    _data['track_number'] = trackNumber;
    _data['type'] = type;
    _data['uri'] = uri;
    return _data;
  }
}

class Artists {
  Artists({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });
  late final ExternalUrls externalUrls;
  late final String href;
  late final String id;
  late final String name;
  late final String type;
  late final String uri;

  Artists.fromJson(Map<String, dynamic> json) {
    externalUrls = ExternalUrls.fromJson(json['external_urls']);
    href = json['href'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['external_urls'] = externalUrls.toJson();
    _data['href'] = href;
    _data['id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['uri'] = uri;
    return _data;
  }
}

class ExternalUrls {
  ExternalUrls({
    required this.spotify,
  });
  late final String spotify;

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['spotify'] = spotify;
    return _data;
  }
}
