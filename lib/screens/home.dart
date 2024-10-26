import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/utils/global.dart';

import '../controllers/page_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController());
    return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: HomeScreenItems,
          controller: landingPageController.pageController,
        ),
        bottomNavigationBar: Obx(
          () => CupertinoTabBar(
            height: 60,
            activeColor: Colors.orange,
            inactiveColor: Colors.grey,
            backgroundColor: Colors.transparent,
            currentIndex: landingPageController.tabIndex.value,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    landingPageController.tabIndex.value == 0
                        ? Icons.home
                        : Icons.home_outlined,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    landingPageController.tabIndex.value == 1
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  label: 'Favorite'),
            ],
            onTap: (value) {
              landingPageController.tabIndex.value = value;
              landingPageController.pageController.jumpToPage(value);
            },
          ),
        ));
  }
}
