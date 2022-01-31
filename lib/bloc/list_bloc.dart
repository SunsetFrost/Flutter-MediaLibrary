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
    try {
      final parms = {
        'page': state.pageIndex + 1,
      };
      final items = await _libraryRepository.getPopularList(parms);

      // items.isEmpty
      //     ? emit(state.copyWith(hasReachedMax: true))
      //     : emit(state.copyWith(
      //         status: Status.success,
      //         type: Type.popular,
      //         items: List.of(state.items)..addAll(items),
      //       ));

      emit(state.copyWith(status: Status.success));
    } catch (e) {
      print(e);
    }
    // try {
    //   // initial
    //   if (state.status == VideoStatus.initial ||
    //       state.type == VideoType.search) {
    //     final videos = await VideoData.getVideoList();
    //     return emit(state.copyWith(
    //       status: VideoStatus.success,
    //       type: VideoType.popular,
    //       videos: videos,
    //       hasReachedMax: false,
    //       pageIndex: 1,
    //     ));
    //   }
    //   // fetch next page
    //   final videos =
    //       await VideoData.getVideoList(page: index, params: event.params);

    //   videos.isEmpty
    //       ? emit(state.copyWith(hasReachedMax: true))
    //       : emit(state.copyWith(
    //           status: VideoStatus.success,
    //           type: VideoType.popular,
    //           videos: List.of(state.videos)..addAll(videos),
    //           hasReachedMax: false,
    //           pageIndex: index));
    // } catch (e) {
    //   emit(state.copyWith(status: VideoStatus.failure));
    // }
  }

  Future<void> _onFetchSearchList(
    FetchSearchList event,
    Emitter<ListState> emit,
  ) async {
    // if (state.type == VideoType.search && state.hasReachedMax) return;
    // try {
    //   // if search text changed, initial
    //   if (state.searchText != event.query) {
    //     final videos = await VideoData.searchVideos(query: event.query);

    //     return emit(state.copyWith(
    //       status: VideoStatus.success,
    //       type: VideoType.search,
    //       videos: videos,
    //       hasReachedMax: false,
    //       pageIndex: 1,
    //       searchText: event.query,
    //     ));
    //   }

    //   // fetch next search page
    //   final index = state.pageIndex + 1;
    //   final videos =
    //       await VideoData.searchVideos(query: event.query, page: index);

    //   videos.isEmpty
    //       ? emit(state.copyWith(hasReachedMax: true))
    //       : emit(state.copyWith(
    //           status: VideoStatus.success,
    //           type: VideoType.search,
    //           videos: List.of(state.videos)..addAll(videos),
    //           pageIndex: index,
    //         ));
    // } catch (e) {
    //   emit(state.copyWith(status: VideoStatus.failure));
    // }
  }
}
