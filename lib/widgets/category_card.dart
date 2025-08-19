import 'package:flutter/material.dart';
import 'package:news_app/pages/category_page.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.title, this.selectedFlag = "General"});
  final String title;
  final String selectedFlag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryPage(
                title: title,
                category: title.toLowerCase(),
                selectedFlag: selectedFlag,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xfff50b09),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
