import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:library_repository/library_repository.dart';

part 'list_event.dart';
part 'list_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc({required LibraryRepository libraryRepository})
      : _libraryRepository = libraryRepository,
        super(const ListState()) {
    on<FetchRecommandList>(_onFetchRecommandList,
        transformer: throttleDroppable(throttleDuration));
    on<FetchSearchList>(_onFetchSearchList,
        transformer: throttleDroppable(throttleDuration));
  }

  final LibraryRepository _libraryRepository;

  Future<void> _onFetchRecommandList(
    FetchRecommandList event,
    Emitter<ListState> emit,
  ) async {
    if (state.hasReachedMax) return;

    final pageIndex = state.pageIndex + 1;
    final params = {
      'page': pageIndex,
    };
    final items = await _libraryRepository.getPopularList(params);

    items.isEmpty
        ? emit(state.copyWith(hasReachedMax: true))
        : emit(state.copyWith(
            status: Status.success,
            type: Type.popular,
            items: List.of(state.items)..addAll(items),
            hasReachedMax: false,
            pageIndex: pageIndex));
  }

  Future<void> _onFetchSearchList(
    FetchSearchList event,
    Emitter<ListState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      // if search text changed, initial
      if (state.searchText != event.query) {
        final items = await _libraryRepository.getSearchList({
          'text': event.query,
        });

        return emit(state.copyWith(
          status: Status.success,
          type: Type.search,
          items: items,
          hasReachedMax: false,
          pageIndex: 1,
          searchText: event.query,
        ));
      }

      // fetch next search page
      final index = state.pageIndex + 1;
      final items = await _libraryRepository
          .getSearchList({'query': event.query, 'page': index});

      items.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(state.copyWith(
              status: Status.success,
              type: Type.search,
              items: List.of(state.items)..addAll(items),
              pageIndex: index,
            ));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
