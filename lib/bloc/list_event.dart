part of 'list_bloc.dart';

abstract class ListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchRecommandList extends ListEvent {
  final Map<String, dynamic>? params;

  FetchRecommandList({this.params});
}

class FetchSearchList extends ListEvent {
  final String query;

  FetchSearchList(this.query);
}
