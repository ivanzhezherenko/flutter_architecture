import 'package:flutter_architecture/redux/model.dart';
import 'package:flutter_architecture/redux/redux/actions.dart';
import 'package:redux/redux.dart';

enum Actions { increment }

List<Item> addItemReducer(List<Item> state, action) {
  return [...state, Item(id: action.id, body: action.item)];
}

List<Item> removeItemReducer(List<Item> state, action) {
  return List.unmodifiable(List.from(state)..remove(action.item));
}

List<Item> removeItemsReducer(List<Item> state, action) {
  return List.unmodifiable([]);
}

final Reducer<List<Item>> itemsReducer = combineReducers<List<Item>>([
  TypedReducer<List<Item>, AddItemAction>(addItemReducer).call,
  TypedReducer<List<Item>, RemoveItemAction>(removeItemReducer).call,
  TypedReducer<List<Item>, RemoveItemsAction>(removeItemsReducer).call,
]);

int incrementReducer(int state, action) {
  if (action == Actions.increment) {
    return state + 1;
  }
  return state;
}

AppState appStateReducer(AppState state, action) {
  return AppState(
    items: itemsReducer(state.items, action),
    count: incrementReducer(state.count, action),
  );
}
