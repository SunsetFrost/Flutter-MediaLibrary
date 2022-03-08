import 'package:library_repository/library_repository.dart';

const String listRoute = '/music/list';
const String detailRoute = '/music/detail';

class DetailArguments {
  final Album album;

  DetailArguments(this.album);
}
