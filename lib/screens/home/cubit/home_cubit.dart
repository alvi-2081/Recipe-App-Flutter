import 'package:bloc/bloc.dart';
import 'package:recipe_app_flutter/repository/recipe_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final RecipeRepository recipeRepository = RecipeRepository();
  Future<void> getRecipeByIngredient(String ingredient) async {
    emit(LoadingHomeState());
    try {
      final response = await recipeRepository.getRecipeByIngredient(ingredient);
      emit(SuccessHomeState(response));
    } catch (e) {
      emit(FailedHomeState(e.toString()));
    }
  }
}
