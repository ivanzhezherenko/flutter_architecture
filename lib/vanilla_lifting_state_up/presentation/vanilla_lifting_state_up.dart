import 'package:flutter/material.dart';
import 'package:flutter_architecture/vanilla_lifting_state_up/data/todo_repository.dart';
import 'package:flutter_architecture/vanilla_lifting_state_up/domain/models/todo.dart';
import 'package:flutter_architecture/vanilla_lifting_state_up/presentation/widgets/todo_input.dart';
import 'package:flutter_architecture/vanilla_lifting_state_up/presentation/widgets/todo_item.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TodoRepository _repository = TodoRepository();
  List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: _todos.map((todo) {
                return TodoItem(
                  todo: todo,
                  onToggleComplete: _toggleComplete,
                );
              }).toList(),
            ),
          ),
          TodoInput(onAddTodo: _addTodo),
        ],
      ),
    );
  }

  Future<void> _loadTodos() async {
    final todos = await _repository.loadTodos();
    setState(() => _todos = todos);
  }

  void _addTodo(String task) {
    setState(
      () => _todos.add(
        Todo(
          task: task,
          complete: false,
        ),
      ),
    );
  }

  void _toggleComplete(Todo todo) {
    setState(() => todo.complete = !todo.complete);
    _repository.saveTodos(_todos);
  }
}
