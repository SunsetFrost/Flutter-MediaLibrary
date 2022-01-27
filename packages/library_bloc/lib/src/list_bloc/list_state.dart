part of 'list_bloc.dart';

@immutable
abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class ListEmpty extends ListState {}

class ListLoading extends ListState {}

class ListError extends ListState {
  @override
  List<Object> get props => [];
}

class ListDefaultResult<T> extends ListState {
  const ListDefaultResult({
    this.results = const [],
    this.hasReachedMax = false,
    this.pageIndex = 0,
  });

  final List<T> results;
  final bool hasReachedMax;
  final int pageIndex;

  ListDefaultResult copyWith({
    List<T>? results,
    bool? hasReachedMax,
    int? pageIndex,
  }) {
    return ListDefaultResult(
      results: results ?? this.results,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object> get props => [results, hasReachedMax, pageIndex];
}

class ListSearchResult<T> extends ListState {
  const ListSearchResult({
    this.results = const [],
    this.hasReachedMax = false,
    this.pageIndex = 0,
  });

  final List<T> results;
  final bool hasReachedMax;
  final int pageIndex;

  ListDefaultResult copyWith({
    List<T>? results,
    bool? hasReachedMax,
    int? pageIndex,
  }) {
    return ListDefaultResult(
      results: results ?? this.results,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object> get props => [results, hasReachedMax, pageIndex];
}
