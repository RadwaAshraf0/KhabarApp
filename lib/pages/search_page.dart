import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articals_model.dart';
import 'package:news_app/services/news_services.dart';
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
  List<ArticlesModel> articles = [];
  bool isLoading = false;

  void _onSearchChanged(String value) async {
    setState(() {
      searchQuery = value;
      isLoading = true;
    });

    if (value.isEmpty) {
      setState(() {
        articles = [];
        isLoading = false;
      });
      return;
    }

    final results = await NewsService(Dio()).getNews(
      null, // flag
      "", // category
      value, // search query
    );

    setState(() {
      articles = results;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    controller.dispose();
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back_ios_new, color: Colors.red),
                      ),
                      SizedBox(width: 100),
                      Text(
                        "Search",
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PlayfairDisplay',
                          color: Color(0xfff50b09),
                        ),
                      ),
                    ],
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
            else if (isLoading)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: CircularProgressIndicator()),
              )
            else if (articles.isEmpty)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text(
                    "No results found",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            else
              NewsListViewBuilder(
                selectedFlag: 'General',
                selectedCategory: 'general',
                searchQuery: searchQuery,
              ),
          ],
        ),
      ),
    );
  }
}
