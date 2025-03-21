import 'package:flutter/material.dart';
import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vamos Cozinhar?")),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children:
            DUMMY_CATEGORIES.map((cat) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: CategoryItem(category: cat),
              );
            }).toList(),
      ),
    );
  }
}
