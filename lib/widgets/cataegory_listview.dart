import 'package:flutter/material.dart';
import 'package:news_app/constants/categories_map.dart';
import 'package:news_app/widgets/category_card.dart';

// ignore: must_be_immutable
class CataegoryListView extends StatelessWidget {
  CataegoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final title = categories[index]['title'] as String;
        return CategoryCard(title: title);
      },
    );
  }
}
