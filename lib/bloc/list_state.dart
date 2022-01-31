part of 'list_bloc.dart';

enum Type { popular, search }
enum Status { initial, success, failure }

class ListState extends Equatable {
  const ListState({
    this.status = Status.initial,
    this.type = Type.popular,
    this.items = const [],
    this.hasReachedMax = false,
    this.pageIndex = 0,
    this.searchText = '',
    this.params = const {},
  });

  final Status status;
  final Type type;
  final List<dynamic> items;
  final bool hasReachedMax;
  final int pageIndex;
  final String searchText;
  final Map<String, String> params;

  ListState copyWith({
    Status? status,
    Type? type,
    List<dynamic>? items,
    bool? hasReachedMax,
    int? pageIndex,
    String? searchText,
    Map<String, String>? params,
  }) {
    return ListState(
      status: status ?? this.status,
      type: type ?? this.type,
      items: items ?? this.items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageIndex: pageIndex ?? this.pageIndex,
      searchText: searchText ?? this.searchText,
      params: params ?? this.params,
    );
  }

  @override
  String toString() {
    return '''VideoState { status: $status, type: $type, hasReachedMax: $hasReachedMax, videos: ${items.length}, pageIndex: $pageIndex, searchText: $searchText }''';
  }

  @override
  List<Object> get props =>
      [status, type, items, hasReachedMax, pageIndex, searchText, params];
}
