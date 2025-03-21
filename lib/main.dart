import 'package:flutter/material.dart';
import 'screens/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CategoryScreen(),
    );
  }
}
