import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/controllers/viewed_recipe_controller.dart';
import 'package:recipe/screens/find_recipe_screen.dart';
import 'package:recipe/screens/recipe_screen.dart';
import 'package:recipe/widgets/foodCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ViewedRecipeController viewedRecipeController =
        Get.put(ViewedRecipeController());
    int len = viewedRecipeController.viewedRecipes.length;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Center(
              child: Image(
                image: const AssetImage('assets/images/food.jpeg'),
                height: height * 0.4,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: height * 0.06,
                width: width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange,
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(ChatScreen());
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Find new recipes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                'Previously viewed recipes         ',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: height * 0.35,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: len,
                itemBuilder: (context, index) => Obx(
                  () => InkWell(
                    onTap: () {
                      Get.to(RecipeScreen(
                          isFav: false,
                          image: viewedRecipeController.viewedRecipes[index]
                              ['image'],
                          label: viewedRecipeController.viewedRecipes[index]
                              ['label'],
                          ingredientLines: viewedRecipeController
                              .viewedRecipes[index]['ingredientLines'],
                          cuisineType: viewedRecipeController
                              .viewedRecipes[index]['cuisineType'][0],
                          mealType: viewedRecipeController.viewedRecipes[index]
                              ['mealType'][0],
                          dishType: viewedRecipeController.viewedRecipes[index]
                              ['dishType'][0],
                          dietLabels: viewedRecipeController
                              .viewedRecipes[index]['dietLabels'],
                          url: viewedRecipeController.viewedRecipes[index]
                              ['url']));
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Food(
                            imageUrl: viewedRecipeController
                                .viewedRecipes[index]['image'],
                            title: viewedRecipeController.viewedRecipes[index]
                                ['label'],
                            mealType: viewedRecipeController
                                .viewedRecipes[index]['mealType'][0],
                            dishType: viewedRecipeController
                                .viewedRecipes[index]['dishType'][0])),
                  ),
                ),
              ),
            ),
          ]))),
    );
  }
}
