import 'package:get/get.dart';
import 'package:recipe/controllers/favorite_recipe_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorageFavorite {
  static const String _keyFavoriteRecipes = 'favorite_recipes';

  static Future<void> saveRecipe(Map<String, dynamic> recipe) async {
    final FavoriteRecipeController favoriteRecipeController =
        Get.put(FavoriteRecipeController());
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteRecipes =
        prefs.getStringList(_keyFavoriteRecipes) ?? [];

    favoriteRecipes.add(json.encode(recipe));

    if (favoriteRecipes.length > 20) {
      favoriteRecipes = favoriteRecipes.sublist(favoriteRecipes.length - 4);
    }

    await prefs.setStringList(_keyFavoriteRecipes, favoriteRecipes);

    favoriteRecipeController.addFavoriteRecipe(recipe);
  }

  static Future<void> getFavoriteRecipes() async {
    final FavoriteRecipeController favoriteRecipeController =
        Get.put(FavoriteRecipeController());
    final prefs = await SharedPreferences.getInstance();
    List<String> viewedRecipes = prefs.getStringList(_keyFavoriteRecipes) ?? [];

    favoriteRecipeController.setFavoriteRecipes(viewedRecipes
        .map((recipe) => json.decode(recipe) as Map<String, dynamic>)
        .toList()
        .reversed
        .toList());
  }

  static Future<void> deleteRecipe(Map<String, dynamic> recipe) async {
    final FavoriteRecipeController favoriteRecipeController =
        Get.put(FavoriteRecipeController());
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteRecipes =
        prefs.getStringList(_keyFavoriteRecipes) ?? [];

    favoriteRecipes.removeWhere((item) => json.encode(recipe) == item);

    await prefs.setStringList(_keyFavoriteRecipes, favoriteRecipes);

    favoriteRecipeController.setFavoriteRecipes(favoriteRecipes
        .map((recipe) => json.decode(recipe) as Map<String, dynamic>)
        .toList()
        .reversed
        .toList());
  }

  static Future<bool> findFavoriteRecipe(Map<String, dynamic> recipe) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteRecipes =
        prefs.getStringList(_keyFavoriteRecipes) ?? [];

    return favoriteRecipes.any((item) => json.encode(recipe) == item);
  }

  static Future<void> clearFavoriteRecipes() async {
    final FavoriteRecipeController favoriteRecipeController =
        Get.put(FavoriteRecipeController());
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_keyFavoriteRecipes);

    favoriteRecipeController.setFavoriteRecipes([]);
  }
}
