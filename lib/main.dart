import 'package:flutter/material.dart';
import 'screens/category_screen.dart';
import 'screens/category_meals_screen.dart';
import 'utils/app-routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          secondary: Colors.amber,
          surface: Color.fromRGBO(255, 254, 229, 1), //substitui o canvasColor
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME: (_) => CategoryScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) => CategoryMealsScreen(),
      },
    );
  }
}
