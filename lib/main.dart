import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app_flutter/network/dio_client_network.dart';
import 'package:recipe_app_flutter/screens/home/home_screen.dart';

void main() async {
  await _initRepos();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Finder',
      home: HomeScreen(),
    );
  }
}

final getIt = GetIt.I;
Future<void> _initRepos() async {
  getIt.registerSingleton(DioClientNetwork());
}
