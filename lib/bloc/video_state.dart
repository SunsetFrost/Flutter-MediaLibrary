part of 'video_bloc.dart';

enum VideoStatus { initial, success, failure }

class VideoState extends Equatable {
  const VideoState({
    this.status = VideoStatus.initial,
    this.videos = const <Video>[],
    this.hasReachedMax = false,
    this.pageIndex = 0,
  });

  final VideoStatus status;
  final List<Video> videos;
  final bool hasReachedMax;
  final int pageIndex;

  VideoState copyWith({
    VideoStatus? status,
    List<Video>? videos,
    bool? hasReachedMax,
    int? pageIndex,
  }) {
    return VideoState(
      status: status ?? this.status,
      videos: videos ?? this.videos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  String toString() {
    return '''VideoState { status: $status, hasReachedMax: $hasReachedMax, videos: ${videos.length}, pageIndex: $pageIndex }''';
  }

  @override
  List<Object> get props => [status, videos, hasReachedMax, pageIndex];
}
