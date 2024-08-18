class Project {
  final String name;
  final List<String> tasks;

  Project({
    required this.name,
    this.tasks = const [],
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'tasks': tasks,
  };

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      tasks: List<String>.from(json['tasks']),
    );
  }
}