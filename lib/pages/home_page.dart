import 'package:flutter/material.dart';
import 'package:news_app/widgets/cataegory_listview.dart';
import 'package:news_app/widgets/flags_menu.dart';
import 'package:news_app/widgets/news_listview_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedFlag = "General";
  String? category = "general";
  String? searchQuery = "";

  @override
  void initState() {
    super.initState();
    _loadSelectedFlag();
  }

  Future<void> _loadSelectedFlag() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedFlag = prefs.getString("selectedFlag") ?? "General";
    });
  }

  Future<void> _saveSelectedFlag(String flag) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("selectedFlag", flag);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: selectedFlag == null
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlagsMenu(
                              selectedFlag: selectedFlag!,
                              onSelected: (flag) {
                                setState(() => selectedFlag = flag);
                                _saveSelectedFlag(flag); 
                              },
                            ),
                          ],
                        ),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'PlayfairDisplay',
                            ),
                            children: [
                              TextSpan(
                                text: 'Khabar ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '+',
                                style: TextStyle(color: Color(0xfff50b09)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Center(
                          child: Text(
                            'Stay Connected, Stay Informed',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),
                        SizedBox(height: 60, child: CataegoryListView()),
                      ],
                    ),
                  ),
                  NewsListViewBuilder(selectedFlag: selectedFlag!, selectedCategory: category!, searchQuery: searchQuery!),
                ],
              ),
      ),
    );
  }
}
