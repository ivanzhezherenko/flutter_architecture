import 'package:flutter/material.dart';

class TodoInput extends StatefulWidget {
  final Function(String) onAddTodo;

  const TodoInput({super.key, required this.onAddTodo});

  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    if (_controller.text.isNotEmpty) {
      widget.onAddTodo(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Шо сьогодні робимо?'),
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