import 'package:recipe_app_flutter/contants/http_constants.dart';
import 'package:recipe_app_flutter/main.dart';
import 'package:recipe_app_flutter/network/dio_client_network.dart';
import 'package:recipe_app_flutter/wrappers/information_wrapper.dart';
import 'package:recipe_app_flutter/wrappers/ingredient_wrapper.dart';
import 'package:recipe_app_flutter/wrappers/nutirition_wrapper.dart';
import 'package:recipe_app_flutter/wrappers/search_recipe_by_name.dart';

class RecipeRepository {
  Future<List<String>> getRecipeByIngredient(String ingredient) async {
    final response = await getIt<DioClientNetwork>()
        .getRequest(HttpConstants.recipeByIngredient + ingredient);
    List<String> recipes =
        List<String>.from(response.map((recipe) => recipe['title'].toString()));
    return recipes;
  }

  Future<SearchRecipeByName> searchRecipeByName(String recipeName) async {
    final response = await getIt<DioClientNetwork>()
        .getRequest(HttpConstants.searchRecipeByName + recipeName);
    return SearchRecipeByName.fromJson(response);
  }

  Future<IngredientWrapper> getIngredient(String recipeId) async {
    final response = await getIt<DioClientNetwork>().getRequest(
        '/$recipeId/ingredientWidget.json?${HttpConstants.apiKeyParam}');
    return IngredientWrapper.fromJson(response);
  }

  Future<NutritionWrapper> getNutrition(String recipeId) async {
    final response = await getIt<DioClientNetwork>().getRequest(
        '/$recipeId/nutritionWidget.json?${HttpConstants.apiKeyParam}');
    return NutritionWrapper.fromJson(response);
  }

  Future<InformationWrapper> getInformateion(String recipeId) async {
    final response = await getIt<DioClientNetwork>()
        .getRequest('/$recipeId/information?${HttpConstants.apiKeyParam}');
    return InformationWrapper.fromJson(response);
  }
}
