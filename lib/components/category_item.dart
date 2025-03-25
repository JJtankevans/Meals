import 'package:flutter/material.dart';
import '../models/category.dart';
import '../utils/app-routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  void _selectCategory(BuildContext context, Category category) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => CategoryMealsScreen(selectedCategory: category),
    //   ),
    // );

    Navigator.of(
      context,
    ).pushNamed(AppRoutes.CATEGORIES_MEALS, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context, category),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).colorScheme.primary,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withAlpha(
                (0.5 * 255).toInt(),
              ), //A forma atual de deixar opacidade é assim
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
