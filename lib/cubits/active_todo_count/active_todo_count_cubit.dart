// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_app_with_bloc/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_with_bloc/models/todo_model.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  //todo 2
  late final StreamSubscription todoListSubscription;

  //todo 3
  final TodoListCubit todoListCubit;

  ActiveTodoCountCubit(
    this.todoListCubit,
  ) : super(ActiveTodoCountState.initial()) {
    //todo 4
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      final int currentActiveTodoCount = todoListState.todos
          .where(
            (Todo todo) => !todo.completed,
          )
          .toList()
          .length;

      //todo 5
      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
    });
  }

  //todo 6 (finish)
  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
