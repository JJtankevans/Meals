import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoryMealsScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    final selectedCategory =
        ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals =
        meals.where((meal) {
          return meal.categories.contains(selectedCategory.id);
        }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: categoryMeals[index]);
        },
      ),
    );
  }
}
