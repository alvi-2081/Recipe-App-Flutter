import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/components/text_component.dart';
import 'package:recipe_app_flutter/components/textfield_component.dart';
import 'package:recipe_app_flutter/contants/color_constants.dart';
import 'package:recipe_app_flutter/screens/home/cubit/home_cubit.dart';
import 'package:recipe_app_flutter/screens/recipes/recipes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit homeCubit;

  final TextEditingController _ingredients = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => homeCubit = HomeCubit(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const TextComponent('Recipe Finder', 40.0),
          backgroundColor: ColorConstants.blue,
          centerTitle: true,
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is SuccessHomeState) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        RecipesScreen(recipes: state.recipesList)),
              );
            }
          },
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/bg1.jpg'),
                fit: BoxFit.cover,
              )),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                        borderRadius: BorderRadius.circular(20.0)),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 8.0,
                    ),
                    margin: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10.0),
                    child: const Column(
                      children: [
                        TextComponent(
                            'Welcome! This app will help you find recipes based on what'
                            ' ingredients you have. Let\'s get started!',
                            20.0),
                        SizedBox(height: 30.0),
                        TextComponent(
                            'Step 1: Check the fridge and see what you have.',
                            20.0),
                        TextComponent(
                            'Step 2: Type the items that you have in the text box below',
                            20.0),
                        TextComponent(
                            'Step 3: Tap on the "Get Recipe" button', 20.0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                        borderRadius: BorderRadius.circular(20.0)),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 8.0,
                    ),
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: const Column(
                      children: [
                        TextComponent(
                            'You will see a list of recipes that you can make with your ingredients.'
                            ' When you tap on a recipe title, you will get a detailed view of that dish.'
                            ' Tap the "Full Recipe" button and you will get the recipe with cooking instructions.'
                            'I hope you find this helpful and that it brings out the inner-chef in you. Happy cooking!',
                            20.0),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 30.0),
                          TextFieldComponent(
                              width: width / 1.3,
                              hintText: 'Enter ingredients here',
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return "Field is required";
                                }
                                return null;
                              },
                              controller: _ingredients),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                            height: 50.0,
                            width: 200.0,
                            child: MaterialButton(
                              splashColor: Colors.grey,
                              color: ColorConstants.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await homeCubit
                                      .getRecipeByIngredient(_ingredients.text);
                                }
                              },
                              child: const TextComponent('Get Recipes!', 25.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
