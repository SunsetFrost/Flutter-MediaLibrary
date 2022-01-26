import 'package:common_api/common_api.dart';
import 'package:pokemon_api/pokemon_api.dart';

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
  toItem(Map<String, dynamic> json) {
    return Pokemon.fromJson(json);
  }

  String get version {
    return 'version 1.0';
  }
}
