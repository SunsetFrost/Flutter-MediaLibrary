import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:media_library/model/Video.dart';
import 'package:media_library/net/video_data.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(const VideoState()) {
    on<VideoFetched>(_onVideoFetched);
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
        ));
      }
      final videos = await VideoData.getVideoList();
      videos.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(state.copyWith(
              status: VideoStatus.success,
              videos: List.of(state.videos)..addAll(videos),
              hasReachedMax: false));
    } catch (e) {
      emit(state.copyWith(status: VideoStatus.failure));
    }
  }
}
