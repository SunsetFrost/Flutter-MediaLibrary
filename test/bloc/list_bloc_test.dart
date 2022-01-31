import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_library/bloc/list_bloc.dart';
import 'package:library_repository/library_repository.dart';

const requestParams = {
  'page': 1,
};

void main() {
  group('bloc test', () {
    late LibraryRepository libraryRepository;

    setUpAll(() {
      final baseUrl = 'http://127.0.0.1:3000';
      final type = APIType.movie;
      libraryRepository = LibraryRepository(baseUrl: baseUrl, type: type);
    });

    buildBloc() {
      return ListBloc(libraryRepository: libraryRepository);
    }

    blocTest<ListBloc, ListState>(
      'list bloc test',
      build: buildBloc,
      act: (bloc) => bloc.add(FetchRecommandList(params: {'page': 1})),
      expect: () => [-1],
    );

    test('get data from cache', () async {
      final result2 = await libraryRepository.getPopularList({'page': 1});
      print(result2);
      expect(result2, isList);
    });
  });
}
