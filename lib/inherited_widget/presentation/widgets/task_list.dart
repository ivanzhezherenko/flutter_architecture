import 'package:flutter/material.dart';
import 'package:flutter_architecture/inherited_widget/presentation/inherited_widget.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = ProjectProvider.of(context)!;
    return ListView(
      children: provider.project.tasks.map((task) {
        return ListTile(title: Text(task));
      }).toList(),
    );
  }
}