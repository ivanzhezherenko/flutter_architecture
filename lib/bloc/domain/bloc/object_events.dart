import 'package:equatable/equatable.dart';

abstract class ObjectEvent extends Equatable {
  const ObjectEvent();

  @override
  List<Object> get props => [];
}

class FetchObjects extends ObjectEvent {}

class SearchObjects extends ObjectEvent {
  final String query;

  const SearchObjects(this.query);

  @override
  List<Object> get props => [query];
}

class ToggleObjectAvailability extends ObjectEvent {
  final String objectId;

  const ToggleObjectAvailability(this.objectId);

  @override
  List<Object> get props => [objectId];
}
