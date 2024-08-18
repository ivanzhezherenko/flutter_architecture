import 'package:flutter_architecture/mobx/domain/models/recipe.dart';
import 'package:mobx/mobx.dart';

part 'recipe_store.g.dart';

class RecipeStore = _RecipeStore with _$RecipeStore;

abstract class _RecipeStore with Store {
  @observable
  ObservableList<Recipe> recipes = ObservableList<Recipe>();

  @action
  void addRecipe(String name, String description) {
    recipes.add(Recipe(name, description));
  }

  @action
  void removeRecipe(Recipe recipe) {
    recipes.remove(recipe);
  }

  @computed
  List<Recipe> get sortedRecipes => recipes.toList()..sort((a, b) => a.name.compareTo(b.name));
}
