// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      json['id'] as int,
      json['name'] as String,
      (json['types'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['stats'] as List<dynamic>)
          .map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
      Pokemon.spritesToImage(json['sprites']),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'types': instance.types,
      'stats': instance.stats,
      'sprites': instance.image,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      json['name'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      json['name'] as String,
      json['base_stat'] as int,
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'name': instance.name,
      'base_stat': instance.baseStat,
    };
