import 'package:flutter/material.dart';
import 'package:flutter_architecture/mobx/presentation/stores/recipe_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final recipeStore = RecipeStore();

class MyMobx extends StatelessWidget {
  const MyMobx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecipeList(),
    );
  }
}

class RecipeList extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Book')),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: recipeStore.recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipeStore.recipes[index];
            return ListTile(
              title: Text(recipe.name),
              subtitle: Text(recipe.description),
              leading: IconButton(
                onPressed: () {
                  recipeStore.removeRecipe(recipe);
                },
                icon: const Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddRecipeDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddRecipeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Recipe'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Recipe Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Recipe Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                recipeStore.addRecipe(nameController.text, descriptionController.text);
                nameController.clear();
                descriptionController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
