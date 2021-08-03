// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    json['id'] as int?,
    json['num'] as String?,
    json['name'] as String?,
    json['img'] as String,
    (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['height'] as String?,
    json['weight'] as String?,
    json['candy'] as String?,
    json['candyCount'] as int?,
    json['egg'] as String?,
    (json['spawnChance'] as num?)?.toDouble(),
    json['avgSpawns'] as int?,
    json['spawnTime'] as String?,
    (json['multipliers'] as List<dynamic>?)
        ?.map((e) => (e as num).toDouble())
        .toList(),
    (json['weaknesses'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'num': instance.num,
      'name': instance.name,
      'img': instance.img,
      'type': instance.type,
      'height': instance.height,
      'weight': instance.weight,
      'candy': instance.candy,
      'candyCount': instance.candyCount,
      'egg': instance.egg,
      'spawnChance': instance.spawnChance,
      'avgSpawns': instance.avgSpawns,
      'spawnTime': instance.spawnTime,
      'multipliers': instance.multipliers,
      'weaknesses': instance.weaknesses,
    };
