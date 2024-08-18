import 'package:flutter/material.dart';
import 'package:flutter_architecture/mvi/domain/models/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(String) onToggle;

  TodoList({required this.todos, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(todo.title),
          trailing: Checkbox(
            value: todo.isCompleted,
            onChanged: (_) => onToggle(todo.id),
          ),
        );
      },
    );
  }
}
