import 'package:get/get.dart';
import 'package:recipe/controllers/viewed_recipe_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorage {
  static const String _keyViewedRecipes = 'viewed_recipes';

  static Future<void> saveRecipe(Map<String, dynamic> recipe) async {
    final ViewedRecipeController viewedRecipeController =
        Get.put(ViewedRecipeController());
    final prefs = await SharedPreferences.getInstance();
    List<String> viewedRecipes = prefs.getStringList(_keyViewedRecipes) ?? [];

    viewedRecipes.add(json.encode(recipe));

    if (viewedRecipes.length > 4) {
      viewedRecipes = viewedRecipes.sublist(viewedRecipes.length - 4);
    }

    await prefs.setStringList(_keyViewedRecipes, viewedRecipes);

    viewedRecipeController.addViewedRecipe(recipe);
  }

  static Future<void> getViewedRecipes() async {
    final ViewedRecipeController viewedRecipeController =
        Get.put(ViewedRecipeController());
    final prefs = await SharedPreferences.getInstance();
    List<String> viewedRecipes = prefs.getStringList(_keyViewedRecipes) ?? [];

    viewedRecipeController.setViewedRecipes(viewedRecipes
        .map((recipe) => json.decode(recipe) as Map<String, dynamic>)
        .toList()
        .reversed
        .toList());
  }
}
