import 'package:recipe_app_flutter/contants/app_constants.dart';

class HttpConstants {
  static const String base = 'https://api.spoonacular.com/recipes';
  static const String imageUrl = 'https://spoonacular.com/recipeImages/';
  static const String apiKeyParam = 'apiKey=${AppConstants.apiKey}';

  static const String recipeByIngredient =
      '/findByIngredients?$apiKeyParam&ingredients=';

  static const String searchRecipeByName = "/search?$apiKeyParam&query=";

  // static const String instructionsApiUrl =
  //     "$base$recipeId/information?apiKey=${AppConstants.apiKey}";
}
