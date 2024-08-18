import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/bloc/domain/models/object_model.dart';

abstract class ObjectState extends Equatable {
  const ObjectState();

  @override
  List<Object> get props => [];
}

class ObjectInitial extends ObjectState {}

class ObjectLoading extends ObjectState {}

class ObjectLoaded extends ObjectState {
  final List<ObjectModel> objects;

  const ObjectLoaded({required this.objects});

  @override
  List<Object> get props => [objects];
}

class ObjectError extends ObjectState {
  final String message;

  const ObjectError(this.message);

  @override
  List<Object> get props => [message];
}
