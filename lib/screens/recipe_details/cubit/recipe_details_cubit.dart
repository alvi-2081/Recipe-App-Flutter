import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:recipe_app_flutter/repository/recipe_repository.dart';
import 'package:recipe_app_flutter/wrappers/information_wrapper.dart';
import 'package:recipe_app_flutter/wrappers/ingredient_wrapper.dart';
import 'package:recipe_app_flutter/wrappers/nutirition_wrapper.dart';
import 'package:recipe_app_flutter/wrappers/search_recipe_by_name.dart';

part 'recipe_details_state.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  RecipeDetailsCubit() : super(RecipeDetailsInitial());

  final RecipeRepository recipeRepository = RecipeRepository();

  Future<void> searchRecipeByName(String recipeName) async {
    emit(LoadingRecipeDetailsState());
    try {
      final response = await recipeRepository.searchRecipeByName(recipeName);
      emit(SuccessRecipeDetailsState(response));
    } catch (e) {
      emit(FailedRecipeDetailsState(e.toString()));
    }
  }

  Future<void> getIngredient(String recipeId) async {
    emit(LoadingRecipeDetailsState());
    try {
      final response = await recipeRepository.getIngredient(recipeId);
      emit(SuccessGetIngredientState(response));
    } catch (e) {
      emit(FailedRecipeDetailsState(e.toString()));
    }
  }

  Future<void> getNutrition(String recipeId) async {
    emit(LoadingRecipeDetailsState());
    try {
      final response = await recipeRepository.getNutrition(recipeId);
      emit(SuccessGetNutritionState(response));
    } catch (e) {
      log(e.toString());
      emit(FailedRecipeDetailsState(e.toString()));
    }
  }

  Future<void> getInformation(String recipeId) async {
    emit(LoadingRecipeDetailsState());
    try {
      final response = await recipeRepository.getInformateion(recipeId);
      emit(SuccessGetInformationState(response));
    } catch (e) {
      emit(FailedRecipeDetailsState(e.toString()));
    }
  }
}
