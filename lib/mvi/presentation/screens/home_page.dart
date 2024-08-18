import 'package:flutter/material.dart';
import 'package:flutter_architecture/mvi/domain/mvi/intents/todo_intent.dart';
import 'package:flutter_architecture/mvi/domain/mvi/states/todo_state.dart';
import 'package:flutter_architecture/mvi/presentation/screens/widgets/todo_list.dart';
import 'package:flutter_architecture/mvi/domain/mvi/todo_presenter/todo_presenter.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late TodoPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = TodoPresenter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MVI To-Do')),
      body: StreamBuilder<TodoState>(
        stream: _presenter.state,
        builder: (context, snapshot) {
          final state = snapshot.data;

          if (state == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return TodoList(
            todos: state.todos,
            onToggle: (id) => _presenter.onIntent(ToggleTodo(id)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _presenter.onIntent(AddTodo(
            'Нова задача ${DateTime.now().millisecondsSinceEpoch}',
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }
}
