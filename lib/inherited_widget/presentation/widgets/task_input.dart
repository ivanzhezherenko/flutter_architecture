import 'package:flutter/material.dart';
import 'package:flutter_architecture/inherited_widget/domain/models/project.dart';
import 'package:flutter_architecture/inherited_widget/presentation/inherited_widget.dart';

class TaskInput extends StatefulWidget {
  const TaskInput({super.key});

  @override
  _TaskInputState createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    if (_controller.text.isNotEmpty) {
      final provider = ProjectProvider.of(context)!;
      final updatedProject = Project(
        name: provider.project.name,
        tasks: List.from(provider.project.tasks)..add(_controller.text),
      );
      provider.updateProject(updatedProject);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'New Task',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
