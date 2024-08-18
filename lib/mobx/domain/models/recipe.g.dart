// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Recipe on _Recipe, Store {
  late final _$nameAtom = Atom(name: '_Recipe.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$descriptionAtom = Atom(name: '_Recipe.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$ingredientsAtom = Atom(name: '_Recipe.ingredients', context: context);

  @override
  ObservableList<String> get ingredients {
    _$ingredientsAtom.reportRead();
    return super.ingredients;
  }

  @override
  set ingredients(ObservableList<String> value) {
    _$ingredientsAtom.reportWrite(value, super.ingredients, () {
      super.ingredients = value;
    });
  }

  late final _$stepsAtom = Atom(name: '_Recipe.steps', context: context);

  @override
  ObservableList<String> get steps {
    _$stepsAtom.reportRead();
    return super.steps;
  }

  @override
  set steps(ObservableList<String> value) {
    _$stepsAtom.reportWrite(value, super.steps, () {
      super.steps = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
description: ${description},
ingredients: ${ingredients},
steps: ${steps}
    ''';
  }
}
