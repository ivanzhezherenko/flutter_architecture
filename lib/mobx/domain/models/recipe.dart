import 'package:mobx/mobx.dart';

part 'recipe.g.dart';

class Recipe = _Recipe with _$Recipe;

abstract class _Recipe with Store {
  @observable
  String name;

  @observable
  String description;

  @observable
  ObservableList<String> ingredients = ObservableList<String>();

  @observable
  ObservableList<String> steps = ObservableList<String>();

  _Recipe(this.name, this.description);
}
