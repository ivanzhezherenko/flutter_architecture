import 'package:flutter_architecture/mvi/domain/models/todo.dart';
import 'package:meta/meta.dart';

@immutable
class TodoState {
  final List<Todo> todos;
  final bool isLoading;

  const TodoState({
    this.todos = const [],
    this.isLoading = false,
  });

  TodoState copyWith({List<Todo>? todos, bool? isLoading}) {
    return TodoState(
      todos: todos ?? this.todos,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
