import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_app_with_bloc/models/todo_model.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final List<Todo> initialTodos;

  FilteredTodosCubit({
    required this.initialTodos,
  }) : super(
          FilteredTodosState(
            filteredTodos: initialTodos,
          ),
        );

  //todo 4 (next show_todos.dart)
  void setFilteredTodos({
    required Filter filter,
    required List<Todo> todos,
    required String searchTerm,
  }) {
    List<Todo> filteredTodos;

    switch (filter) {
      case Filter.active:
        filteredTodos = todos.where((element) => !element.completed).toList();
        break;
      case Filter.completed:
        filteredTodos = todos.where((element) => element.completed).toList();
      case Filter.all:
        filteredTodos = todos;
      default:
        filteredTodos = todos;
    }

    if (searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where(
            (element) => element.desc.toLowerCase().contains(
                  searchTerm,
                ),
          )
          .toList();
    }

    emit(state.copyWith(filteredTodos: filteredTodos));
  }
}
