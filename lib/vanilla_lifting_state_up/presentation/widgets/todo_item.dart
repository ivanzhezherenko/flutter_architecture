import 'package:flutter/material.dart';
import 'package:flutter_architecture/vanilla_lifting_state_up/domain/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onToggleComplete;

  const TodoItem({super.key, required this.todo, required this.onToggleComplete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.task),
      trailing: Checkbox(
        value: todo.complete,
        onChanged: (_) {
          onToggleComplete(todo);
        },
      ),
    );
  }
}