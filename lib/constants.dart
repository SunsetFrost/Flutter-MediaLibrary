// const String backendURI = 'http://192.168.4.224';
const String backendURI = 'http://127.0.0.1:3000';
const String apiVersion = '/api/v1';
const bool isDev = true;
const bool isMock = false;

class PokemonType {
  final String name;
  final String nameEn;
  final int color;

  PokemonType({
    required this.name,
    required this.nameEn,
    required this.color,
  });
}

Map<String, PokemonType> pokemonTypeMap = {
  'normal': PokemonType(name: '一般', nameEn: 'normal', color: 0xFF8F8E5E),
  'fighting': PokemonType(name: '格斗', nameEn: 'fighting', color: 0xFF7B211E),
  'flying': PokemonType(name: '飞行', nameEn: 'flying', color: 0xFF9578EA),
  'poison': PokemonType(name: '毒', nameEn: 'poison', color: 0xFF892E89),
  'ground': PokemonType(name: '地面', nameEn: 'ground', color: 0xFFCBAB56),
  'rock': PokemonType(name: '岩石', nameEn: 'rock', color: 0xFFA8912C),
  'bug': PokemonType(name: '虫', nameEn: 'bug', color: 0xFF98AD19),
  'ghost': PokemonType(name: '幽灵', nameEn: 'ghost', color: 0xFF5C4286),
  'steel': PokemonType(name: '钢', nameEn: 'steel', color: 0xFFAAA8C5),
  'fire': PokemonType(name: '火', nameEn: 'fire', color: 0xFFEA3825),
  'water': PokemonType(name: '水', nameEn: 'water', color: 0xFF5679EC),
  'grass': PokemonType(name: '草', nameEn: 'grass', color: 0xFF8BC560),
  'electric': PokemonType(name: '电', nameEn: 'electric', color: 0xFFF6CE2E),
  'psychic': PokemonType(name: '超能力', nameEn: 'psychic', color: 0xFFF33D75),
  'ice': PokemonType(name: '冰', nameEn: 'ice', color: 0xFF88D0CF),
  'dragon': PokemonType(name: '龙', nameEn: 'dragon', color: 0xFF5C14F1),
  'dark': PokemonType(name: '恶', nameEn: 'dark', color: 0xFF5C4638),
  'unknown': PokemonType(name: '？？？', nameEn: 'unknown', color: 0xFF57907E),
  'fairy': PokemonType(name: '妖精', nameEn: 'fairy', color: 0xFFF589D9),
  'shadow': PokemonType(name: '？？', nameEn: 'shadow', color: 0xFF2D2332),
};
