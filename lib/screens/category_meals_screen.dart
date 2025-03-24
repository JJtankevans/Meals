import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory =
        ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals =
        DUMMY_MEALS.where((meal) {
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
