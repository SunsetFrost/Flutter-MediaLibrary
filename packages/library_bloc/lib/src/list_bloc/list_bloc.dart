import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:library_repository/library_repository.dart';

part 'list_state.dart';
part 'list_event.dart';

const _duration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (event, mapper) {
    return droppable<E>().call(event.throttle(duration), mapper);
  };
}

class ListBloc<T> extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListEmpty()) {
    on<FetchDefaultList>(_onFetchDefaultList,
        transformer: throttleDroppable(_duration));
    on<FetchSearchList>(_onFetchSearchList,
        transformer: throttleDroppable(_duration));
  }

  Future<void> _onFetchDefaultList(
    FetchDefaultList event,
    Emitter<ListState> emit,
  ) async {}

  Future<void> _onFetchSearchList(
    FetchSearchList event,
    Emitter<ListState> emit,
  ) async {}
}
