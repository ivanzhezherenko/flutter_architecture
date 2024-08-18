import 'package:flutter/material.dart';
import 'package:flutter_architecture/bloc/domain/bloc/object_bloc.dart';
import 'package:flutter_architecture/bloc/domain/bloc/object_events.dart';
import 'package:flutter_architecture/bloc/domain/models/object_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ObjectList extends StatelessWidget {
  final List<ObjectModel> objects;

  const ObjectList({Key? key, required this.objects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: objects.length,
      itemBuilder: (context, index) {
        final object = objects[index];
        return ListTile(
          title: Text(object.name ?? 'Unknown Name'),
          subtitle: Text(
              'Color: ${object.data?.color ?? 'N/A'}, Capacity: ${object.data?.capacity ?? 'N/A'}'),
          trailing: Switch(
            value: object.isAvailable ?? false,
            onChanged: (value) {
              context.read<ObjectBloc>().add(ToggleObjectAvailability(object.id.toString()));
            },
          ),
        );
      },
    );
  }
}
