# Media Library
- [Media Library](#media-library)
  - [项目介绍](#项目介绍)
    - [Video](#video)
    - [Music](#music)
    - [Book](#book)
    - [Game](#game)
    - [pokemon](#pokemon)
  - [Roadmap](#roadmap)
    - [project structure](#project-structure)
    - [Pokemon List Page](#pokemon-list-page)
      - [Card](#card)
      - [Search](#search)
      - [中文](#中文)
    - [Pokemon Detail Page](#pokemon-detail-page)
    - [Custom Theme](#custom-theme)
    - [Mock API](#mock-api)
  - [数据获取&JSON自动转换Dart类](#数据获取json自动转换dart类)
    - [包安装](#包安装)
      - [安装Bug](#安装bug)
    - [编写模版类](#编写模版类)
    - [Null Safety](#null-safety)
    - [类代码自动生成](#类代码自动生成)
      - [一次性生成](#一次性生成)
      - [持续生成](#持续生成)
    - [消费自动生成的实体类](#消费自动生成的实体类)
  - [剑气加载动画](#剑气加载动画)
  - [Mock Data](#mock-data)
  - [Route](#route)
  - [Bug](#bug)
  - [参考](#参考)
## 项目介绍
favor media collection
### Video
- API source  
[the movie db](https://www.themoviedb.org/documentation/api?language=en-US)
### Music
- API source  
youtube music

### Book
- API source  
google book
### Game
- API source  
[RAWG](https://rawg.io/apidocs)
### pokemon
- API source  
[PokeAPI](https://pokeapi.co)

## Roadmap

### project structure
- [x] route
- [x] 子app管理自身路由(模仿flutter gallery路由管理)
### Pokemon List Page
#### Card
- [x] picture
- [x] layout
- [x] type
- [x] icon
- [x] font

#### Search
- [x] search
- [ ] filter
  实现方案 
  - expanedList? ✖️
  - [x] container + visible  ✔️
  - [ ] 对接后台 
#### 中文

pokemon api支持多语言
> 部分信息不支持
- [x] 语言更换为中文

### Pokemon Detail Page
- [x] detail page widget
- [ ] model
- [ ] data fetch

### Custom Theme
- [x] 抽取样式
### Mock API
- [x] dio interceptor 实现


## 数据获取&JSON自动转换Dart类
使用`json_serializable`转换第三方API提供的口袋妖怪JSON数据

### 包安装

```
dependencies:
  # Your other regular dependencies here
  json_annotation: <latest_version>

dev_dependencies:
  # Your other dev_dependencies here
  build_runner: <latest_version>
  json_serializable: <latest_version>

```

#### 安装Bug
- 包安装时按照官方的介绍报错
json_annotation的版本太高导致，换为较低包版本编译通过 
```
dependencies:
  flutter:
    sdk: flutter
  json_annotation: 4.0.1
  http: 0.13.0

dev_dependencies:
  build_runner: ^1.11.5

  # Used by tests. Not required to use `json_serializable`.
  build_verify: ^2.0.0

  json_serializable: 4.1.3
```

### 编写模版类
根据口袋妖怪API编写模版类
```dart
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'Pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> type;
  ...

  Pokemon(
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    ...
  );

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

```

### Null Safety
由于Dart在2.12环境以上支持并默认开启Null Safety特性，因此在类编写时可能为空的属性时声明需要修改。
```dart
final int? id;
final String? num;
final String? name;
```
修改为
```dart
final int id;
final String num;
final String name;
```

### 类代码自动生成
#### 一次性生成
根目录运行命令即可自动生成
```
flutter pub run build_runner build
```
#### 持续生成
开启一个`watcher`监视项目文件并自动编译我们需要的文件
```
 flutter pub run build_runner watch
```

### 消费自动生成的实体类
```dart
List<Pokemon> parseData(response) {
  final parsed = jsonDecode(response)['pokemon'];
  final pokemonList = parsed.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
  return pokemonList;
}
```


## 剑气加载动画
实现参考 [Flutter实现"剑气"加载](https://juejin.cn/post/7002977635206692901)

## Mock Data

## Route
-  route
   -  flutter route 1.0
  
  - 匿名route
  - 指定route
  - onGenerateRoute

- flutter route 2.0

  - page
  - route
  - route delegate


## Bug

- [x] 图片加载后调试闪退
- [x] When building Flutter applications, you may run into the following error:
Vertical viewport was given unbounded height

column 内有gridview控件，需要放入`expand`内


- [ ] 后退滑动直接回主页面

- [x] epub包需要的realm依赖安装时间很长，需等待

## 参考
- [Flutter官网](https://flutter.dev/docs/development/data-and-backend/json)