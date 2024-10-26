import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe/shared_preference/favorite_recipe_preference.dart';
import 'package:recipe/shared_preference/previously_viewed_preference.dart';
import '../screens/home.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

splashService() async {
  await LocalStorage.getViewedRecipes();
  await LocalStorageFavorite.getFavoriteRecipes();
  await Future.delayed(const Duration(seconds: 7));
  Get.offAll(() => Home(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500));
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    splashService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Lottie.asset('assets/animations/loading.json'),
              ),
              const Text(
                'Welcome',
                style:
                    TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              const Text(
                'Just a momment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ));
  }
}
