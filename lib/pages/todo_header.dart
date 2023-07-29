import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_bloc/cubits/cubits.dart';
import 'package:todo_app_with_bloc/models/todo_model.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Todo',
          style: TextStyle(fontSize: 40.0),
        ),

        //todo 2
        BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            final int activeTodoCount = state.todos
                .where((Todo todo) => !todo.completed)
                .toList()
                .length;

            //todo 3 (next filtered_todos_cubit.dart)
            context
                .read<ActiveTodoCountCubit>()
                .calculateActiveTodoCount(activeTodoCount);
          },
          child: Text(
            '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} item left',
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
