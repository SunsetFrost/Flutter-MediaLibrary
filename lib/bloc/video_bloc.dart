import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:media_library/model/Video.dart';
import 'package:media_library/net/video_data.dart';

part 'video_event.dart';
part 'video_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(const VideoState()) {
    on<VideoFetchPopular>(_onVideoFetchPopular,
        transformer: throttleDroppable(throttleDuration));
    on<VideoFetchSearch>(_onVideoFetchSearch,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onVideoFetchPopular(
    VideoFetchPopular event,
    Emitter<VideoState> emit,
  ) async {
    if (state.type == VideoType.popular && state.hasReachedMax) return;
    try {
      // initial
      if (state.status == VideoStatus.initial ||
          state.type == VideoType.search) {
        final videos = await VideoData.getVideoList();
        return emit(state.copyWith(
          status: VideoStatus.success,
          type: VideoType.popular,
          videos: videos,
          hasReachedMax: false,
          pageIndex: 1,
        ));
      }
      // fetch next page
      final index = state.pageIndex + 1;
      final videos =
          await VideoData.getVideoList(page: index, params: event.params);

      videos.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(state.copyWith(
              status: VideoStatus.success,
              type: VideoType.popular,
              videos: List.of(state.videos)..addAll(videos),
              hasReachedMax: false,
              pageIndex: index));
    } catch (e) {
      emit(state.copyWith(status: VideoStatus.failure));
    }
  }

  Future<void> _onVideoFetchSearch(
    VideoFetchSearch event,
    Emitter<VideoState> emit,
  ) async {
    if (state.type == VideoType.search && state.hasReachedMax) return;
    try {
      // if search text changed, initial
      if (state.searchText != event.query) {
        final videos = await VideoData.searchVideos(query: event.query);

        return emit(state.copyWith(
          status: VideoStatus.success,
          type: VideoType.search,
          videos: videos,
          hasReachedMax: false,
          pageIndex: 1,
          searchText: event.query,
        ));
      }

      // fetch next search page
      final index = state.pageIndex + 1;
      final videos =
          await VideoData.searchVideos(query: event.query, page: index);

      videos.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(state.copyWith(
              status: VideoStatus.success,
              type: VideoType.search,
              videos: List.of(state.videos)..addAll(videos),
              pageIndex: index,
            ));
    } catch (e) {
      emit(state.copyWith(status: VideoStatus.failure));
    }
  }
}
