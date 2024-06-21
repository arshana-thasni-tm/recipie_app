import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipie_app/provider/recipeProvider.dart';
import 'package:recipie_app/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider()..fetchRecipes()),
      ],
      child: MaterialApp(
        title: 'Recipe App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: RecipeListPage(),
      ),
    );
  }
}