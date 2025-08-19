import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/search_page.dart';
import 'package:news_app/pages/categories_page.dart';
import 'package:news_app/pages/home_page.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  final _controller = NotchBottomBarController(index: 0);

  final List<Widget> _pages = [HomePage(), CategoriesPage(), SearchPage()];

  int maxCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_controller.index],
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: Colors.white,
        kIconSize: 24,
        kBottomRadius: 28,
        showLabel: true,
        bottomBarItems: [
          const BottomBarItem(
            inActiveItem: Icon(Icons.home, color: Colors.grey),
            activeItem: Icon(Icons.home, color: Color(0xfff50b09)),
            itemLabel: 'Home',
          ),
          const BottomBarItem(
            inActiveItem: Icon(Icons.category_outlined, color: Colors.grey),
            activeItem: Icon(Icons.category, color: Color(0xfff50b09)),
            itemLabel: 'Category',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.search, color: Colors.grey),
            activeItem: Icon(Icons.search, color: Color(0xfff50b09)),
            itemLabel: 'Search',
          ),
        ],
        onTap: (index) {
          setState(() {
            _controller.index = index;
          });
        },
      ),
    );
  }
}
