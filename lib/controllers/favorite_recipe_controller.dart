import 'package:get/get.dart';

class FavoriteRecipeController extends GetxController {
  var favoriteRecipes = <Map<String, dynamic>>[].obs;

  void setFavoriteRecipes(List<Map<String, dynamic>> recipes) {
    favoriteRecipes.assignAll(recipes);
  }

  void addFavoriteRecipe(Map<String, dynamic> recipe) {
    favoriteRecipes.insert(0, recipe);
    if (favoriteRecipes.length > 20) {
      favoriteRecipes.removeLast();
    }
  }
}
