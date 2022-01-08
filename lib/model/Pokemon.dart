import 'package:json_annotation/json_annotation.dart';

part 'Pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final int id;
  final String name;
  List<Type> types;
  List<Stat> stats;

  Pokemon(
    this.id,
    this.name,
    this.types,
    this.stats,
  );

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Type {
  final String name;
  final String url;

  Type(this.name, this.url);

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Stat {
  final String name;
  @JsonKey(name: 'base_stat')
  final int baseStat;

  Stat(this.name, this.baseStat);

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
  Map<String, dynamic> toJson() => _$StatToJson(this);
}
