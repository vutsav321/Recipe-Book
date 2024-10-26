import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String cuisine;
  final String dishType;
  final String mealType;
  final List<dynamic> dietLabels;

  const FoodCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.cuisine,
    required this.dishType,
    required this.mealType,
    required this.dietLabels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.orange[50],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Cuisine: $cuisine'),
                  Text('Dish Type: $dishType'),
                  Text('Meal Type: $mealType'),
                  Text('Diet: ${dietLabels.join(' | ')}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
