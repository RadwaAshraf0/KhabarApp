import 'package:flutter/material.dart';
import 'package:news_app/pages/search_page.dart';
import 'package:news_app/pages/categories_page.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/widgets/bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('selectedFlag', prefs.getString('selectedFlag') ?? 'General');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const BottomNavWidget(),
        '/Home': (context) => const HomePage(),
        '/Categories': (context) => const CategoriesPage(),
        '/category': (context) => const CategoriesPage(),
        '/Bookmark': (context) => const SearchPage(),
      },
    );
  }
}
