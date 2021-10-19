import 'package:flutter/material.dart';

String capitalize(String s) {
  return s[0].toUpperCase() + s.substring(1);
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

String getMockJsonPath(String path) {
  const _jsonDir = 'assets/json';
  const _jsonExtension = '.json';

  if (path == '/pokemon') {
    return _jsonDir + '/pokemon/pokeList' + _jsonExtension;
  } else if (path.startsWith('/pokemon/')) {
    return _jsonDir + '/pokemon/pokeDetail' + _jsonExtension;
  } else {
    return '';
  }
}
