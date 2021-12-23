part of 'video_bloc.dart';

enum VideoType { popular, search }
enum VideoStatus { initial, success, failure }

class VideoState extends Equatable {
  const VideoState({
    this.status = VideoStatus.initial,
    this.type = VideoType.popular,
    this.videos = const <Video>[],
    this.hasReachedMax = false,
    this.pageIndex = 0,
    this.searchText = '',
  });

  final VideoStatus status;
  final VideoType type;
  final List<Video> videos;
  final bool hasReachedMax;
  final int pageIndex;
  final String searchText;

  VideoState copyWith({
    VideoStatus? status,
    VideoType? type,
    List<Video>? videos,
    bool? hasReachedMax,
    int? pageIndex,
    String? searchText,
  }) {
    return VideoState(
      status: status ?? this.status,
      type: type ?? this.type,
      videos: videos ?? this.videos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageIndex: pageIndex ?? this.pageIndex,
      searchText: searchText ?? this.searchText,
    );
  }

  @override
  String toString() {
    return '''VideoState { status: $status, type: $type, hasReachedMax: $hasReachedMax, videos: ${videos.length}, pageIndex: $pageIndex, searchText: $searchText }''';
  }

  @override
  List<Object> get props =>
      [status, type, videos, hasReachedMax, pageIndex, searchText];
}
