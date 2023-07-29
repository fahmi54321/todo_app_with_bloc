// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'active_todo_count_cubit.dart';

//todo 1 (next active_todo_count_cubit.dart)
class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;
  const ActiveTodoCountState({
    required this.activeTodoCount,
  });

  factory ActiveTodoCountState.initial() {
    return const ActiveTodoCountState(activeTodoCount: 0);
  }

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [activeTodoCount];
}
