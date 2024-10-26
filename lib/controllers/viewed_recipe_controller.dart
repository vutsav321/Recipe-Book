import 'package:get/get.dart';

class ViewedRecipeController extends GetxController {
  var viewedRecipes = <Map<String, dynamic>>[].obs;

  void setViewedRecipes(List<Map<String, dynamic>> recipes) {
    viewedRecipes.assignAll(recipes);
  }

  void addViewedRecipe(Map<String, dynamic> recipe) {
    viewedRecipes.insert(0, recipe);
    if (viewedRecipes.length > 4) {
      viewedRecipes.removeLast();
    }
  }
}
