import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe/models/recipe_model.dart';
import 'package:recipe/screens/recipe_result_screen.dart';
import 'package:http/http.dart' as http;
import 'package:recipe/api_credentials.dart';

class PreparingScreen extends StatefulWidget {
  final cusineType;
  final mealType;
  final dishType;
  final diet;
  const PreparingScreen(
      {super.key,
      required this.cusineType,
      required this.mealType,
      required this.dishType,
      required this.diet});

  @override
  State<PreparingScreen> createState() => _PreparingScreenState();
}

Future<void> apiCall(String appId, String appKey, String cuisineType,
    String mealType, String dishType, String diet) async {
  const String url =
      'https://api.edamam.com/api/recipes/v2?type=public&imageSize=LARGE';
  final response = await http.get(
    Uri.parse(
        '$url&app_id=$appId&app_key=$appKey&cuisineType=$cuisineType&mealType=$mealType&dishType=$dishType&diet=$diet'),
  );

  if (response.statusCode == 200) {
    final data = await json.decode(response.body);
    final recipeModel = RecipeHits.fromJson(data);
    Get.off(() => RecipeResultScreen(recipeHits: recipeModel));
  } else {
    throw Exception('Failed to load recipes');
  }
}

class _PreparingScreenState extends State<PreparingScreen> {
  @override
  void initState() {
    apiCall(api_id, api_key, widget.cusineType, widget.mealType,
        widget.dishType, widget.diet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/animations/preparing.json'),
          ),
          const SizedBox(height: 10),
          const Text(
            'Preparing...',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ));
  }
}
