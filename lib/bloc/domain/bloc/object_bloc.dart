import 'package:bloc/bloc.dart';
import 'package:flutter_architecture/bloc/data/repository/object_repository.dart';
import 'package:flutter_architecture/bloc/domain/bloc/object_events.dart';
import 'package:flutter_architecture/bloc/domain/models/object_model.dart';
import 'object_state.dart';

class ObjectBloc extends Bloc<ObjectEvent, ObjectState> {
  final ObjectRepository repository;
  List<ObjectModel> allObjects = [];

  ObjectBloc({required this.repository}) : super(ObjectInitial()) {
    on<SearchObjects>(_onSearchObjects);
    on<FetchObjects>(_onFetchObjects);
    on<ToggleObjectAvailability>(_onToggleObjectAvailability);
  }

  void _onFetchObjects(FetchObjects event, Emitter<ObjectState> emit) async {
    emit(ObjectLoading());
    try {
      final objects = await repository.fetchObjects();
      allObjects = objects;
      emit(ObjectLoaded(objects: objects));
    } catch (e) {
      emit(const ObjectError('Failed to fetch objects'));
    }
  }

  void _onSearchObjects(SearchObjects event, Emitter<ObjectState> emit) {
    if (state is ObjectLoaded) {
      final filteredObjects = event.query.isEmpty
          ? allObjects
          : allObjects
              .where((object) =>
                  object.name?.toLowerCase().contains(event.query.toLowerCase()) ?? false)
              .toList();
      emit(ObjectLoaded(objects: filteredObjects));
    }
  }

  void _onToggleObjectAvailability(ToggleObjectAvailability event, Emitter<ObjectState> emit) {
    if (state is ObjectLoaded) {
      final objects = (state as ObjectLoaded).objects;
      final updatedObjects = objects.map((object) {
        if (object.id == event.objectId) {
          return ObjectModel(
            id: object.id,
            name: object.name,
            data: object.data,
            isAvailable: !(object.isAvailable ?? false), // Змінюємо статус наявності
          );
        }
        return object;
      }).toList();

      allObjects = allObjects.map((object) {
        if (object.id == event.objectId) {
          return ObjectModel(
            id: object.id,
            name: object.name,
            data: object.data,
            isAvailable: !(object.isAvailable ?? false),
          );
        }
        return object;
      }).toList();

      emit(ObjectLoaded(objects: updatedObjects));
    }
  }
}
