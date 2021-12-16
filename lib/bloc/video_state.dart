part of 'video_bloc.dart';

enum VideoStatus { initial, success, failure }

class VideoState extends Equatable {
  const VideoState({
    this.status = VideoStatus.initial,
    this.videos = const <Video>[],
    this.hasReachedMax = false,
  });

  final VideoStatus status;
  final List<Video> videos;
  final bool hasReachedMax;

  VideoState copyWith({
    VideoStatus? status,
    List<Video>? videos,
    bool? hasReachedMax,
  }) {
    return VideoState(
      status: status ?? this.status,
      videos: videos ?? this.videos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''VideoState { status: $status, hasReachedMax: $hasReachedMax, videos: ${videos.length} }''';
  }

  @override
  List<Object> get props => [status, videos, hasReachedMax];
}
