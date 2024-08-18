import 'package:flutter/material.dart';
import 'package:flutter_architecture/vanilla_lifting_state_up/presentation/vanilla_lifting_state_up.dart';

class MyVanillaLiftingStateUp extends StatelessWidget {
  const MyVanillaLiftingStateUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoList(),
    );
  }
}