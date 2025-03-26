import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/screens/settings_screens.dart';
import 'screens/category_meals_screen.dart';
import 'utils/app-routes.dart';
import 'screens/tabs_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals =
          DUMMY_MEALS.where((meal) {
            final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
            final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
            final filterVegan = settings.isVegan && !meal.isVegan;
            final filterVegetaria = settings.isVegetarian && !meal.isVegetarian;

            return !filterGluten &&
                !filterLactose &&
                !filterVegan &&
                !filterVegetaria;
          }).toList();
    });
  }

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
        AppRoutes.CATEGORIES_MEALS:
            (context) => CategoryMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAILS: (context) => MealDetailScreen(),
        AppRoutes.SETTINGS:
            (context) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            ),
      },
    );
  }
}
