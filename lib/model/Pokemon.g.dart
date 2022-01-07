// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      json['id'] as int,
      json['name'] as String,
      (json['types'] as List<dynamic>).map((e) => e as Object).toList(),
      (json['stats'] as List<dynamic>).map((e) => e as Object).toList(),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'types': instance.types,
      'stats': instance.stats,
    };
