import 'package:flutter/material.dart';
import 'package:news_app/constants/categories_map.dart';
import 'package:news_app/widgets/categories_card.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.2,
          children: categories
              .map(
                (cat) => CategoriesCard(
                  icon: cat['icon'],
                  label: cat['title'],
                  color: cat['color'],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
