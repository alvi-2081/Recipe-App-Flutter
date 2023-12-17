import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/components/text_component.dart';
import 'package:recipe_app_flutter/contants/color_constants.dart';
import 'package:recipe_app_flutter/contants/http_constants.dart';
import 'package:recipe_app_flutter/screens/recipe_details/cubit/recipe_details_cubit.dart';
import 'package:recipe_app_flutter/wrappers/nutirition_wrapper.dart';
import 'package:recipe_app_flutter/wrappers/search_recipe_by_name.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final String recipeName;

  const RecipeDetailsScreen({super.key, required this.recipeName});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  late RecipeDetailsCubit recipeDetailsCubit;
  List<Results> recipeByNameList = [];
  List<Nutrients> nutritionList = [];
  String selectedRecipeId = '';
  String ingredients = '';
  String instructions = '';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) {
        recipeDetailsCubit = RecipeDetailsCubit();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          recipeDetailsCubit.searchRecipeByName(widget.recipeName);
        });
        return recipeDetailsCubit;
      },
      child: BlocConsumer<RecipeDetailsCubit, RecipeDetailsState>(
        listener: (context, state) {
          log('$state');
          if (state is SuccessRecipeDetailsState) {
            recipeByNameList = state.searchRecipeByName.results ?? [];
          }
          if (state is SuccessGetIngredientState) {
            ingredients = (state.ingredientWrapper.ingredients ?? []).isNotEmpty
                ? state.ingredientWrapper.ingredients!
                    .map((ingredient) => ingredient.name)
                    .join(', ')
                : "No ingredients available";
            recipeDetailsCubit.getInformation(selectedRecipeId);
          }
          if (state is SuccessGetInformationState) {
            instructions = state.informationWrapper.instructions ??
                "No instructions available";
            recipeDetailsCubit.getNutrition(selectedRecipeId);
          }
          if (state is SuccessGetNutritionState) {
            nutritionList = state.nutritionWrapper.nutrients ?? [];
            showRecipeDialog(ingredients, instructions);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: BackButton(
                  onPressed: () => Navigator.of(context).pop(),
                  color: Colors.white),
              title: const TextComponent('Recipe Details', 40.0),
              backgroundColor: ColorConstants.blue,
              centerTitle: true,
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg1.jpg'), fit: BoxFit.cover),
              ),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration:
                      const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
                  child: ListView.builder(
                      itemCount: recipeByNameList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: TextComponent("Recipe Name:", 24.0),
                            ),
                            TextComponent(
                                recipeByNameList[index].title ?? '', 24.0),
                            const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: TextComponent("Time to Prepare:", 24.0),
                            ),
                            TextComponent(
                                "${recipeByNameList[index].readyInMinutes} Minutes",
                                24.0),
                            const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: TextComponent("Servings:", 24.0),
                            ),
                            TextComponent(
                                "${recipeByNameList[index].servings}", 24.0),
                            const TextComponent("Image", 24.0),
                            Image.network(
                              "${HttpConstants.imageUrl}${recipeByNameList[index].image}",
                              width: width / 1.3,
                              height: height / 3,
                            ),
                            const SizedBox(height: 5.0),
                            ElevatedButton(
                              onPressed: () {
                                selectedRecipeId =
                                    recipeByNameList[index].id.toString();
                                recipeDetailsCubit.getIngredient(
                                    recipeByNameList[index].id.toString());
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorConstants.blue),
                              child: const TextComponent("Full Recipe", 15.0),
                            ),
                            const SizedBox(height: 15.0),
                          ],
                        );
                      })),
            ),
          );
        },
      ),
    );
  }

  showRecipeDialog(String ingredients, String instructions) {
    // The part for the dialog box that displays the ingredients and cooking instructions
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const TextBlack("Full Recipe:", 24.0),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextBlack("Ingredients:", 20.0),
                  const SizedBox(height: 20.0),
                  TextBlack(ingredients, 18.0),
                  const SizedBox(height: 20.0),
                  const TextBlack("Instructions:", 20.0),
                  const SizedBox(height: 20.0),
                  Html(
                    data: instructions,
                  ),
                  const TextBlack("Nutrtiton Facts:", 20.0),
                  if (nutritionList.isNotEmpty)
                    ...List.generate(
                        nutritionList.length,
                        (index) => ListTile(
                              title: Text(nutritionList[index].name ?? ''),
                              trailing: TextBlack(
                                  '${nutritionList[index].amount} ${nutritionList[index].amount}',
                                  14.0),
                            ))
                  else
                    const TextBlack("No Nutrition Available", 18.0),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
