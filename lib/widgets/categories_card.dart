import 'package:flutter/material.dart';
import 'package:news_app/pages/category_page.dart';

class CategoriesCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final String selectedFlag;

  CategoriesCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
    this.selectedFlag = "General",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryPage(
            title: label,
            category: label.toLowerCase(),
            selectedFlag: selectedFlag,
          )),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: color),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
