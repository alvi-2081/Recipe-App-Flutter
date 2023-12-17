import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/components/text_component.dart';
import 'package:recipe_app_flutter/contants/color_constants.dart';
import 'package:recipe_app_flutter/screens/recipe_details/recipe_details.dart';

class RecipesScreen extends StatefulWidget {
  final List<String> recipes;

  const RecipesScreen({super.key, required this.recipes});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const TextComponent('Recipe Search', 40.0),
        backgroundColor: ColorConstants.blue,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg1.jpg'), fit: BoxFit.cover)),
        child: Container(
          decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
          child: ListView.builder(
            itemCount: widget.recipes.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                // title: SansText(_recipes[index], 20.0),
                title: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsScreen(
                            recipeName: widget.recipes[index]),
                      ),
                    );
                  },
                  child: TextComponent(
                      '${index + 1} : ${widget.recipes[index]}', 20.0),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
