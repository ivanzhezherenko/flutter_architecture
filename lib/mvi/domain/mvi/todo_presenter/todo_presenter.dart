import 'package:flutter_architecture/mvi/domain/models/todo.dart';
import 'package:flutter_architecture/mvi/domain/mvi/intents/todo_intent.dart';
import 'package:flutter_architecture/mvi/domain/mvi/states/todo_state.dart';
import 'package:rxdart/rxdart.dart';

class TodoPresenter {
  final _stateSubject = BehaviorSubject<TodoState>.seeded(const TodoState());

  Stream<TodoState> get state => _stateSubject.stream;

  void onIntent(TodoIntent intent) {
    if (intent is AddTodo) {
      _addTodo(intent);
    } else if (intent is ToggleTodo) {
      _toggleTodo(intent);
    }
  }

  void _addTodo(AddTodo intent) {
    final currentState = _stateSubject.value;
    final updatedTodos = List<Todo>.from(currentState.todos)
      ..add(Todo(id: DateTime.now().toString(), title: intent.title));

    _stateSubject.add(currentState.copyWith(todos: updatedTodos));
  }

  void _toggleTodo(ToggleTodo intent) {
    final currentState = _stateSubject.value;
    final updatedTodos = currentState.todos.map((todo) {
      if (todo.id == intent.id) {
        return todo.copyWith(isCompleted: !todo.isCompleted);
      }
      return todo;
    }).toList();

    _stateSubject.add(currentState.copyWith(todos: updatedTodos));
  }

  void dispose() {
    _stateSubject.close();
  }
}
