import 'package:common_api/common_api.dart';

class PokemonAPIConvertFailure implements Exception {}

class PokemonAPIClient extends CommonAPI {
  PokemonAPIClient({
    required baseUrl,
  }) : super(baseUrl: baseUrl);

  @override
  String get endPoint {
    return '/pokemon';
  }

  @override
  String get popularPattern {
    return '/';
  }

  @override
  String get searchPattern {
    return '/search';
  }

  @override
  String get detailPattern {
    return '/';
  }

  @override
  Pokemon toItem(Map<String, dynamic> json) {
    return Pokemon.fromJson(json);
  }

  @override
  List<Pokemon> toList(dynamic data) {
    return data.map<Pokemon>((json) => toItem(json)).toList();
  }

  @override
  Pokemon toDetailItem(Map<String, dynamic> json) {
    return Pokemon.fromJson(json);
  }

  String get version {
    return 'version 1.0';
  }
}
