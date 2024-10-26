class RecipeHits {
  final List<RecipeModel> recipes;

  RecipeHits({required this.recipes});

  factory RecipeHits.fromJson(Map<String, dynamic> json) {
    return RecipeHits(
      recipes: (json['hits'] as List<dynamic>)
          .map((hit) =>
              RecipeModel.fromJson(hit['recipe'] as Map<String, dynamic>))
          .toList(),
    );
  }
}

class RecipeModel {
  late final String label;
  late final String image;
  late final String url;
  final List<dynamic> dietLabels;
  final List<dynamic> ingredientLines;
  final List<String> cuisineType;
  final List<String> mealType;
  final List<String> dishType;

  RecipeModel({
    required this.label,
    required this.image,
    required this.url,
    required this.dietLabels,
    required this.ingredientLines,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
  });

  // Factory constructor to parse JSON and handle potential null values
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      label: json['label'],
      image: json['images']['LARGE']['url'],
      url: json['url'],
      dietLabels: List<String>.from(json['dietLabels'] ?? []),
      ingredientLines: List<String>.from(json['ingredientLines'] ?? []),
      cuisineType: List<String>.from(json['cuisineType'] ?? []),
      mealType: List<String>.from(json['mealType'] ?? []),
      dishType: List<String>.from(json['dishType'] ?? []),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'image': image,
      'url': url,
      'dietLabels': dietLabels,
      'ingredientLines': ingredientLines,
      'cuisineType': cuisineType,
      'mealType': mealType,
      'dishType': dishType,
    };
  }
}
