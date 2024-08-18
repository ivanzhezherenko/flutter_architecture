// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecipeStore on _RecipeStore, Store {
  Computed<List<Recipe>>? _$sortedRecipesComputed;

  @override
  List<Recipe> get sortedRecipes => (_$sortedRecipesComputed ??=
          Computed<List<Recipe>>(() => super.sortedRecipes,
              name: '_RecipeStore.sortedRecipes'))
      .value;

  late final _$recipesAtom =
      Atom(name: '_RecipeStore.recipes', context: context);

  @override
  ObservableList<Recipe> get recipes {
    _$recipesAtom.reportRead();
    return super.recipes;
  }

  @override
  set recipes(ObservableList<Recipe> value) {
    _$recipesAtom.reportWrite(value, super.recipes, () {
      super.recipes = value;
    });
  }

  late final _$_RecipeStoreActionController =
      ActionController(name: '_RecipeStore', context: context);

  @override
  void addRecipe(String name, String description) {
    final _$actionInfo = _$_RecipeStoreActionController.startAction(
        name: '_RecipeStore.addRecipe');
    try {
      return super.addRecipe(name, description);
    } finally {
      _$_RecipeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeRecipe(Recipe recipe) {
    final _$actionInfo = _$_RecipeStoreActionController.startAction(
        name: '_RecipeStore.removeRecipe');
    try {
      return super.removeRecipe(recipe);
    } finally {
      _$_RecipeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recipes: ${recipes},
sortedRecipes: ${sortedRecipes}
    ''';
  }
}
