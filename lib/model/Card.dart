import 'package:equatable/equatable.dart';

/// base card model
class Card extends Equatable {
  final String id;
  final String name;
  final String desc;

  Card({
    required this.id,
    required this.name,
    required this.desc,
  });

  @override
  List<Object> get props => [
        id,
        name,
        desc,
      ];
}
