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
    on<VideoFetched>(_onVideoFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onVideoFetched(
    VideoFetched event,
    Emitter<VideoState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == VideoStatus.initial) {
        final videos = await VideoData.getVideoList();
        return emit(state.copyWith(
          status: VideoStatus.success,
          videos: videos,
          hasReachedMax: false,
          pageIndex: 1,
        ));
      }
      // fetch next page
      final index = state.pageIndex + 1;
      print('''pageindex $index''');
      final videos = await VideoData.getVideoList(page: index);
      print(
          '''pageindex: $index, videoslength ${videos.length} ${videos.isEmpty}''');
      videos.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(state.copyWith(
              status: VideoStatus.success,
              videos: List.of(state.videos)..addAll(videos),
              hasReachedMax: false,
              pageIndex: index));
    } catch (e) {
      emit(state.copyWith(status: VideoStatus.failure));
    }
  }
}
