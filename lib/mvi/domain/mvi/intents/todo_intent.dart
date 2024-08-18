abstract class TodoIntent {}


class AddTodo extends TodoIntent {
  final String title;
  AddTodo(this.title);
}

class ToggleTodo extends TodoIntent {
  final String id;
  ToggleTodo(this.id);
}
