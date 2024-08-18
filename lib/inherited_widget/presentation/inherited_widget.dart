import 'package:flutter/material.dart';
import 'package:flutter_architecture/inherited_widget/domain/models/project.dart';

class ProjectProvider extends InheritedWidget {
  final Project project;
  final Function(Project) updateProject;

  const ProjectProvider({
    super.key,
    required this.project,
    required this.updateProject,
    required super.child,
  });

  @override
  bool updateShouldNotify(ProjectProvider oldWidget) {
    return oldWidget.project != project;
  }

  static ProjectProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ProjectProvider>();
}
