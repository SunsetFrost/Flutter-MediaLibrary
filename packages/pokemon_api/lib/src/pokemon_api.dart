import 'package:common_api/common_api.dart';
import 'package:pokemon_api/pokemon_api.dart';

class PokemonAPIConvertFailure implements Exception {}

class PokemonAPIClient extends CommonAPI {
  PokemonAPIClient({
    required baseUrl,
  }) : super(baseUrl: baseUrl);

  @override
  String get endPoint {
    return '/video';
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
    try {
      return Pokemon.fromJson(json);
    } catch (e) {
      throw PokemonAPIConvertFailure();
    }
  }

  String get version {
    return 'version 1.0';
  }
}
