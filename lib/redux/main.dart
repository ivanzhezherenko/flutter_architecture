import 'package:flutter/material.dart';
import 'package:flutter_architecture/redux/model.dart';
import 'package:flutter_architecture/redux/redux/actions.dart';
import 'package:flutter_architecture/redux/redux/reducers.dart' as app_redux;

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MyRedux extends StatelessWidget {
  const MyRedux({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Store<AppState>(
      app_redux.appStateReducer,
      initialState: AppState.initialState(),
    );

    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello World")),
      body: StoreConnector<AppState, ViewModel>(
          converter: (store) => ViewModel.create(store),
          builder: (context, ViewModel viewModel) => Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Text("${viewModel.count}"),
                    AddItemWidget(viewModel),
                    Expanded(child: ItemListWidget(viewModel)),
                    RemoveItemsButton(viewModel)
                  ],
                ),
              )),
      floatingActionButton: StoreConnector<AppState, dynamic>(
        converter: (store) => () => store.dispatch(app_redux.Actions.increment),
        builder: (context, add) =>
            FloatingActionButton(child: const Text('+'), onPressed: () => add()),
      ),
    );
  }
}

class RemoveItemsButton extends StatelessWidget {
  final ViewModel model;

  const RemoveItemsButton(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Remove All Items"),
      onPressed: () => model.onRemoveItems(),
    );
  }
}

class ItemListWidget extends StatelessWidget {
  final ViewModel model;

  const ItemListWidget(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: model.items
            .map((Item item) => ListTile(
                title: Text("${item.body} ${item.id}"),
                leading: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => model.onRemoveItem(item),
                )))
            .toList());
  }
}

class AddItemWidget extends StatefulWidget {
  final ViewModel model;

  const AddItemWidget(this.model, {super.key});

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItemWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(hintText: "Add an item"),
      onSubmitted: (String s) {
        widget.model.onAddItem(s);
        controller.text = '';
      },
    );
  }
}

class ViewModel {
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;
  final Function() increment;
  final int count;

  ViewModel(
      {required this.count,
      required this.increment,
      required this.items,
      required this.onAddItem,
      required this.onRemoveItem,
      required this.onRemoveItems});

  factory ViewModel.create(Store<AppState> store) {
    onAddItem(String body) => store.dispatch(AddItemAction(body));

    onRemoveItem(Item item) => store.dispatch(RemoveItemAction(item));

    onRemoveItems() => store.dispatch(RemoveItemsAction());

    onIncrement() => store.dispatch(app_redux.Actions.increment);

    return ViewModel(
      items: store.state.items,
      onAddItem: onAddItem,
      onRemoveItem: onRemoveItem,
      onRemoveItems: onRemoveItems,
      count: store.state.count,
      increment: onIncrement,
    );
  }
}
