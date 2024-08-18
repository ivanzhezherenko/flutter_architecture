import 'package:flutter/material.dart';
import 'package:flutter_architecture/inherited_widget/data/project_repository.dart';
import 'package:flutter_architecture/inherited_widget/domain/models/project.dart';
import 'package:flutter_architecture/inherited_widget/presentation/inherited_widget.dart';
import 'package:flutter_architecture/inherited_widget/presentation/widgets/task_input.dart';
import 'package:flutter_architecture/inherited_widget/presentation/widgets/task_list.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  Project? _currentProject;
  final ProjectRepository _repository = ProjectRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    _loadProject();
  }


  @override
  Widget build(BuildContext context) {
    if (_currentProject != null) {
      return ProjectProvider(
        project: _currentProject!,
        updateProject: _updateProject,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Project: ${_currentProject?.name}'),
          ),
          body: const Column(
            children: [
              Expanded(child: TaskList()),
              TaskInput(),
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }
  void _loadProject() async {
    final projects = await _repository.loadProjects();
    setState(() => _currentProject = projects.isNotEmpty ? projects.first : Project(name: 'Todo'));
  }

  void _updateProject(Project updatedProject) {
    setState(() {
      _currentProject = updatedProject;
    });
    if (_currentProject != null) {
      _repository.saveProjects([_currentProject!]);
    }
  }
}
