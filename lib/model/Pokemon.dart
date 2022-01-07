import 'package:json_annotation/json_annotation.dart';

part 'Pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final int id;
  final String name;
  final List<Object> types;
  final List<Object> stats;

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
