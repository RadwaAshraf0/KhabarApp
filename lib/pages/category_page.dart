import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_listview_builder.dart';

class CategoryPage extends StatelessWidget {
  final String title;
  final String category;
  final String selectedFlag;
  final String searchQuery;

  const CategoryPage({
    super.key,
    required this.title,
    this.category = "general",
    this.selectedFlag = "General", this.searchQuery = "",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.red),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlayfairDisplay',
                    ),
                    children: [
                      TextSpan(
                        text: title,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const TextSpan(
                        text: ' News',
                        style: TextStyle(color: Color(0xfff50b09)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          NewsListViewBuilder(
            selectedFlag: selectedFlag,
            selectedCategory: category,
          ),
        ],
      ),
    );
  }
}
