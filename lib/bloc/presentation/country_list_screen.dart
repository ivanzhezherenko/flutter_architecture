import 'package:flutter/material.dart';
import 'package:flutter_architecture/bloc/domain/bloc/object_bloc.dart';
import 'package:flutter_architecture/bloc/domain/bloc/object_events.dart';
import 'package:flutter_architecture/bloc/domain/bloc/object_state.dart';
import 'package:flutter_architecture/bloc/presentation/widgets/object_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Object Explorer'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search by name',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                // Відправляємо подію пошуку при кожній зміні тексту
                context.read<ObjectBloc>().add(SearchObjects(query));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<ObjectBloc, ObjectState>(
              builder: (context, state) {
                if (state is ObjectLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ObjectLoaded) {
                  return ObjectList(objects: state.objects);
                } else if (state is ObjectError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('Press the button to fetch objects'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
