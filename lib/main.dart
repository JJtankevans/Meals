import 'package:flutter/material.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'screens/category_screen.dart';
import 'screens/category_meals_screen.dart';
import 'utils/app-routes.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          secondary: Colors.amber,
          surface: Color.fromRGBO(255, 254, 180, 1), //substitui o canvasColor
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 22,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME: (_) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) => CategoryMealsScreen(),
        AppRoutes.MEAL_DETAILS: (context) => MealDetailScreen(),
      },
    );
  }
}
