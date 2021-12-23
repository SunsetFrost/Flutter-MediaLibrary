part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class VideoFetchPopular extends VideoEvent {}

class VideoFetchSearch extends VideoEvent {
  final String query;

  VideoFetchSearch(this.query);
}
