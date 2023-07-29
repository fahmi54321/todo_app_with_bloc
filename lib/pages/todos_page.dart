import 'package:flutter/material.dart';
import 'package:todo_app_with_bloc/pages/create_todo.dart';
import 'package:todo_app_with_bloc/pages/search_and_filter_todo.dart';
import 'package:todo_app_with_bloc/pages/show_todos.dart';
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
                TodoHeader(),
                CreateTodo(),
                SizedBox(height: 20.0),
                SearchAndFilterTodo(), //todo 1
                ShowTodos(), // todo 2 (finish)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
