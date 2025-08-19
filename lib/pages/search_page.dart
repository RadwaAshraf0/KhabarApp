import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_listview_builder.dart';
import 'package:news_app/widgets/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  String searchQuery = "";
  Timer? _debounce;

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        searchQuery = value;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlayfairDisplay',
                      color: Color(0xfff50b09),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Center(
                    child: Text(
                      'Search and explore top news',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SearchWidget(
                    controller: controller,
                    onChanged: _onSearchChanged,
                  ),
                ],
              ),
            ),

            if (searchQuery.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: Image.asset("assets/images/empty.png")),
              )
            else
              NewsListViewBuilder(
                searchQuery: searchQuery,
                selectedFlag: '',
                selectedCategory: '',
              ),
          ],
        ),
      ),
    );
  }
}
