import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipie_app/screens/widgets/recipeGrid.dart';
import 'package:recipie_app/screens/widgets/search.dart';
import '../provider/recipeProvider.dart';

class RecipeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
        actions: [
          IconButton(
            icon: const Icon(Icons.search,color: Colors.black,size: 20,),
            onPressed: () async {
              final String? query = await showSearch(
                context: context,
                delegate: RecipeSearchDelegate(),
              );
              if (query != null && query.isNotEmpty) {
                recipeProvider.searchRecipes(query);
              }
            },
          ),
        ],
      ),
      body: recipeProvider.recipes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 600) {
            return RecipeGridView(recipeProvider.recipes, 4, constraints.maxWidth);
          } else if (constraints.maxWidth >= 400) {
            return RecipeGridView(recipeProvider.recipes, 2, constraints.maxWidth);
          } else {
            return RecipeGridView(recipeProvider.recipes, 1, constraints.maxWidth);
          }
        },
      ),
    );
  }
}
