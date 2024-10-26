import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/controllers/favorite_recipe_controller.dart';
import 'package:recipe/screens/recipe_screen.dart';
import 'package:recipe/widgets/listFoodCard.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteRecipeController favoriteRecipeController =
        Get.put(FavoriteRecipeController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // backgroundColor: Colors.orange,
          title: const Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              'Favorite recipes',
              style: TextStyle(fontSize: 19),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: favoriteRecipeController.favoriteRecipes.length,
                  itemBuilder: (context, index) => InkWell(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FoodCard(
                          imageUrl: favoriteRecipeController
                              .favoriteRecipes[index]['image'],
                          title: favoriteRecipeController.favoriteRecipes[index]
                              ['label'],
                          cuisine: favoriteRecipeController
                              .favoriteRecipes[index]['cuisineType'],
                          dishType: favoriteRecipeController
                              .favoriteRecipes[index]['dishType'],
                          mealType: favoriteRecipeController
                              .favoriteRecipes[index]['mealType'],
                          dietLabels: favoriteRecipeController
                              .favoriteRecipes[index]['dietLabels'],
                        )),
                    onTap: () {
                      Get.to(() => RecipeScreen(
                            isFav: true,
                            image: favoriteRecipeController
                                .favoriteRecipes[index]['image'],
                            label: favoriteRecipeController
                                .favoriteRecipes[index]['label'],
                            ingredientLines: favoriteRecipeController
                                .favoriteRecipes[index]['ingredientLines'],
                            cuisineType: favoriteRecipeController
                                .favoriteRecipes[index]['cuisineType'],
                            mealType: favoriteRecipeController
                                .favoriteRecipes[index]['mealType'],
                            dishType: favoriteRecipeController
                                .favoriteRecipes[index]['dishType'],
                            dietLabels: favoriteRecipeController
                                .favoriteRecipes[index]['dietLabels'],
                            url: favoriteRecipeController.favoriteRecipes[index]
                                ['url'],
                          ));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
