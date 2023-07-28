part of 'todo_list_cubit.dart';

//todo 1 (next todo_list_cubit.dart)

class TodoListState extends Equatable {
  final List<Todo> todos;
  const TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return const TodoListState(
      todos: [],
    );
  }

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [todos];
}
