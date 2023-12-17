part of 'recipe_details_cubit.dart';

sealed class RecipeDetailsState {}

final class RecipeDetailsInitial extends RecipeDetailsState {}

class InitialRecipeDetailsState extends RecipeDetailsState {}

class LoadingRecipeDetailsState extends RecipeDetailsState {}

class SuccessRecipeDetailsState extends RecipeDetailsState {
  final SearchRecipeByName searchRecipeByName;
  SuccessRecipeDetailsState(this.searchRecipeByName);
}

class SuccessGetIngredientState extends RecipeDetailsState {
  final IngredientWrapper ingredientWrapper;
  SuccessGetIngredientState(this.ingredientWrapper);
}

class SuccessGetNutritionState extends RecipeDetailsState {
  final NutritionWrapper nutritionWrapper;
  SuccessGetNutritionState(this.nutritionWrapper);
}

class SuccessGetInformationState extends RecipeDetailsState {
  final InformationWrapper informationWrapper;
  SuccessGetInformationState(this.informationWrapper);
}

class FailedRecipeDetailsState extends RecipeDetailsState {
  final String message;
  FailedRecipeDetailsState(this.message);
}
