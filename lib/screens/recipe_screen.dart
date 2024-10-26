import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/shared_preference/favorite_recipe_preference.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeScreen extends StatelessWidget {
  final String image;
  final String label;
  final List<dynamic> ingredientLines;
  final String cuisineType;
  final String mealType;
  final String dishType;
  final List<dynamic> dietLabels;
  final String url;
  final bool isFav;

  const RecipeScreen(
      {Key? key,
      required this.image,
      required this.label,
      required this.ingredientLines,
      required this.cuisineType,
      required this.mealType,
      required this.dishType,
      required this.dietLabels,
      required this.url,
      required this.isFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isFavorite = isFav.obs;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(label),
          actions: [
            Obx(
              () => IconButton(
                onPressed: () async {
                  isFavorite.value = !isFavorite.value;
                  if (isFavorite.value) {
                    await LocalStorageFavorite.saveRecipe({
                      'image': image,
                      'label': label,
                      'ingredientLines': ingredientLines,
                      'cuisineType': cuisineType,
                      'mealType': mealType,
                      'dishType': dishType,
                      'dietLabels': dietLabels,
                      'instructionsUrl': url,
                    });
                  } else {
                    await LocalStorageFavorite.deleteRecipe({
                      'image': image,
                      'label': label,
                      'ingredientLines': ingredientLines,
                      'cuisineType': cuisineType,
                      'mealType': mealType,
                      'dishType': dishType,
                      'dietLabels': dietLabels,
                      'url': url,
                    });
                  }
                },
                icon: Icon(
                  isFavorite.value ? Icons.favorite : Icons.favorite_border,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    image,
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Ingredients:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...ingredientLines.map((ingredient) => Text('- $ingredient')),
                const SizedBox(height: 16),
                Text('Cuisine: $cuisineType'),
                Text('Meal Type: $mealType'),
                Text('Dish Type: $dishType'),
                Text('Diet: ${dietLabels.join(' | ')}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.orange),
                  ),
                  onPressed: () {
                    Get.to(() => WebViewScreen(url: url));
                  },
                  child: Text(
                    'View Instructions',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Instructions'),
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (String url) {
                setState(() {
                  isLoading = true;
                });
              },
              onPageFinished: (String url) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            if (isLoading)
              Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
