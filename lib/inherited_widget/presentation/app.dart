import 'package:flutter/material.dart';
import 'package:flutter_architecture/inherited_widget/presentation/project_screen.dart';

class MyInheritedWidget extends StatelessWidget {
  const MyInheritedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProjectScreen(),
    );
  }
}