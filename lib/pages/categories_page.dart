import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_widget.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'PlayfairDisplay',
              ),
            ),

            const SizedBox(height: 5),
            const Center(
              child: Text(
                'Explore various news categories',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 25),
            CategoriesWidget(),
          ],
        ),
      ),
    );
  }
}
