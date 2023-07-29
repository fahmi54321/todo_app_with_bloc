import 'package:flutter/material.dart';
import 'package:todo_app_with_bloc/pages/create_todo.dart';
import 'package:todo_app_with_bloc/pages/todo_header.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 40.0,
            ),
            child: Column(
              children: [
                TodoHeader(), //todo 1
                CreateTodo(), // todo 2 (finish)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
