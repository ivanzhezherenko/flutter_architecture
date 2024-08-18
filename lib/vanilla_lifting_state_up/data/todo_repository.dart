import 'package:flutter_architecture/vanilla_lifting_state_up/domain/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TodoRepository {
  static const _todosKey = 'todos_key';

  Future<List<Todo>> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosString = prefs.getString(_todosKey);
    print('sasasas ${todosString}');
    if (todosString != null) {
      final List<dynamic> decodedTodos = jsonDecode(todosString);
      return decodedTodos.map((item) => Todo.fromJson(item)).toList();
    }
    return [];
  }

  Future<void> saveTodos(List<Todo> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final todosString = jsonEncode(todos.map((todo) => todo.toJson()).toList());
    prefs.setString(_todosKey, todosString);
  }
}