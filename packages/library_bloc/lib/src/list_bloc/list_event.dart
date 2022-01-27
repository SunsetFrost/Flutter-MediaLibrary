part of 'list_bloc.dart';

abstract class ListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDefaultList extends ListEvent {
  FetchDefaultList({this.params});

  final Map<String, dynamic>? params;
}

class FetchSearchList extends ListEvent {
  FetchSearchList({required this.query, this.params});

  final String query;
  final Map<String, dynamic>? params;
}
