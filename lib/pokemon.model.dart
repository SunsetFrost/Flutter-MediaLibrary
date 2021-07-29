class PokemonModel {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final String candy;
  final int candyCount;
  final String egg;
  final double spawnChance;
  final int avgSpawns;
  final String spawnTime;
  final List<double> multipliers;
  final List<String> weaknesses;
  // final List<NextEvolution> nextEvolution;

  PokemonModel({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    // required this.nextEvolution
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img: json['img'],
      type: json['type'].cast<String>(),
      height: json['height'],
      weight: json['weight'],
      candy: json['candy'],
      candyCount: json['candy_count'],
      egg: json['egg'],
      spawnChance: json['spawn_chance'],
      avgSpawns: json['avg_spawns'],
      spawnTime: json['spawn_time'],
      multipliers: json['multipliers'].cast<double>(),
      weaknesses: json['weaknesses'].cast<String>(),
      // nextEvolution: json['nextEvolution'],
    );
  }
}
