class Todo {
  final String task;
  bool complete;

  Todo({
    required this.task,
    this.complete = false,
  });

  Map<String, dynamic> toJson() => {
    'task': task,
    'complete': complete,
  };

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      task: json['task'],
      complete: json['complete'],
    );
  }
}