import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_repository/library_repository.dart';
import 'package:media_library/bloc/list_bloc.dart';

void main() {
  group('LisBloc', () {
    late String baseUrl;
    late APIType type;

    setUpAll(() {
      baseUrl = 'http://127.0.0.1:3000';
      type = APIType.movie;
    });

    ListBloc buildBloc() {
      return ListBloc(baseUrl: baseUrl, libraryType: type);
    }

    blocTest<ListBloc, ListState>('list bloc',
        build: buildBloc,
        act: (bloc) => bloc.add(FetchRecommandList(params: {'page': 1})),
        verify: (bloc) => {print(bloc.state)});
  });
}
