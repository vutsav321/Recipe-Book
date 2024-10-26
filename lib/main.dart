import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.orange,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.orange,
        appBarTheme: const AppBarTheme(
          color: Colors.orange,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange,
        appBarTheme: const AppBarTheme(
          color: Colors.orange,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const SpalshScreen(),
    );
  }
}
