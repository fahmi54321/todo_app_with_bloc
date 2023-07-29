// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_app_with_bloc/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app_with_bloc/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_with_bloc/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_app_with_bloc/models/todo_model.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  late StreamSubscription todoListSubscription;
  late StreamSubscription todoSearchSubscription;
  late StreamSubscription todoFilterSubscription;

  final TodoListCubit todoListCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoFilterCubit todoFilterCubit;

  final List<Todo> initialTodos;

  FilteredTodosCubit({
    required this.todoListCubit,
    required this.todoSearchCubit,
    required this.todoFilterCubit,
    required this.initialTodos,
  }) : super(
          FilteredTodosState(
            filteredTodos: initialTodos,
          ),
        ) {
    todoListSubscription = todoListCubit.stream.listen((_) {
      setFilteredTodos();
    });

    todoSearchSubscription = todoSearchCubit.stream.listen((_) {
      setFilteredTodos();
    });

    todoFilterSubscription = todoFilterCubit.stream.listen((_) {
      setFilteredTodos();
    });
  }

  void setFilteredTodos() {
    List<Todo> filteredTodos;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        filteredTodos = todoListCubit.state.todos
            .where((element) => !element.completed)
            .toList();
        break;
      case Filter.completed:
        filteredTodos = todoListCubit.state.todos
            .where((element) => element.completed)
            .toList();
      case Filter.all:
        filteredTodos = todoListCubit.state.todos;
      default:
        filteredTodos = todoListCubit.state.todos;
    }

    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where(
            (element) => element.desc.toLowerCase().contains(
                  todoSearchCubit.state.searchTerm,
                ),
          )
          .toList();
    }

    emit(state.copyWith(filteredTodos: filteredTodos));
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    todoSearchSubscription.cancel();
    todoFilterSubscription.cancel();
    return super.close();
  }
}
