import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/models/recipe_model.dart';
import 'package:recipe/screens/recipe_screen.dart';
import 'package:recipe/shared_preference/previously_viewed_preference.dart';
import 'package:recipe/widgets/listFoodCard.dart';

class RecipeResultScreen extends StatelessWidget {
  final RecipeHits recipeHits;
  const RecipeResultScreen({super.key, required this.recipeHits});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // backgroundColor: Colors.orange,
          title: const Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              'Recipes results',
              style: TextStyle(fontSize: 19),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            recipeHits.recipes.isEmpty
                ? const Center(
                    child: Text(
                      'No recipes found',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: recipeHits.recipes.length,
                itemBuilder: (context, index) => InkWell(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FoodCard(
                        imageUrl: recipeHits.recipes[index].image,
                        title: recipeHits.recipes[index].label,
                        cuisine: recipeHits.recipes[index].cuisineType[0],
                        dishType: recipeHits.recipes[index].dishType[0],
                        mealType: recipeHits.recipes[index].mealType[0],
                        dietLabels: recipeHits.recipes[index].dietLabels,
                      )),
                  onTap: () async {
                    await LocalStorage.saveRecipe(
                        recipeHits.recipes[index].toJson());
                    Get.to(RecipeScreen(
                      isFav: false,
                      image: recipeHits.recipes[index].image,
                      label: recipeHits.recipes[index].label,
                      ingredientLines:
                          recipeHits.recipes[index].ingredientLines,
                      cuisineType: recipeHits.recipes[index].cuisineType[0],
                      mealType: recipeHits.recipes[index].mealType[0],
                      dishType: recipeHits.recipes[index].dishType[0],
                      dietLabels: recipeHits.recipes[index].dietLabels,
                      url: recipeHits.recipes[index].url,
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
