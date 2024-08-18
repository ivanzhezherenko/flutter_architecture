import 'package:flutter_architecture/inherited_widget/domain/models/project.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProjectRepository {
  static const _projectsKey = 'projects_key';

  Future<List<Project>> loadProjects() async {
    final prefs = await SharedPreferences.getInstance();
    final projectsString = prefs.getString(_projectsKey);
    if (projectsString != null) {
      final List<dynamic> decodedProjects = jsonDecode(projectsString);
      return decodedProjects.map((item) => Project.fromJson(item)).toList();
    }
    return [];
  }

  Future<void> saveProjects(List<Project> projects) async {
    final prefs = await SharedPreferences.getInstance();
    final projectsString = jsonEncode(projects.map((project) => project.toJson()).toList());
    prefs.setString(_projectsKey, projectsString);
  }
}