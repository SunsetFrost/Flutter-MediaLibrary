import 'package:json_annotation/json_annotation.dart';

part 'Pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final int id;
  final String name;
  final List<String> type;
  final int state;

  Pokemon(
    this.id,
    this.name,
    this.type,
    this.state,
  );

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
