import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/flags_map.dart';
import 'package:news_app/models/articals_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/services/search_service.dart';
import 'package:news_app/widgets/empty_state.dart';
import 'package:news_app/widgets/news_listview.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({
    super.key,
    required this.selectedFlag,
    required this.selectedCategory,
    this.searchQuery,
  });

  final String selectedFlag;
  final String selectedCategory;
  final String? searchQuery;

  Future<List<ArticlesModel>> _fetchArticles(
      String flag, String category, String? query) async {
    if (query != null && query.isNotEmpty) {
      // ✅ لو فيه searchQuery استخدم SearchService
      return await SearchService(Dio()).searchNews(query);
    } else {
      // ✅ لو مفيش searchQuery استخدم NewsService
      final countryCode = flagsMap[flag];
      return await NewsService(Dio()).getNews(countryCode, category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticlesModel>>(
      future: _fetchArticles(selectedFlag, selectedCategory, searchQuery),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(child: EmptyState());
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return NewsListView(articles: snapshot.data!);
        } else {
          return const SliverToBoxAdapter(child: EmptyState());
        }
      },
    );
  }
}


//import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app/constants/flags_map.dart';
// import 'package:news_app/models/articals_model.dart';
// import 'package:news_app/services/news_services.dart';
// import 'package:news_app/widgets/empty_state.dart';
// import 'package:news_app/widgets/news_listview.dart';

// class NewsListViewBuilder extends StatefulWidget {
//   const NewsListViewBuilder({super.key, required this.selectedFlag});

//   final String selectedFlag;

//   @override
//   State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
// }

// class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
//   List<ArticlesModel> articles = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchArticles(widget.selectedFlag);
//   }

//   @override
//   void didUpdateWidget(covariant NewsListViewBuilder oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.selectedFlag != widget.selectedFlag) {
//       _fetchArticles(widget.selectedFlag);
//     }
//   }

//   Future<void> _fetchArticles(String flag) async {
//     final countryCode = flagsMap[flag] ?? flagsMap["General"];
//     if (countryCode != null) {
//       final fetchedArticles = await NewsService(
//         Dio(),
//       ).getGeneralNews(countryCode);
//       if (!mounted) return;
//       setState(() => articles = fetchedArticles);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (articles.isEmpty) {
//       return const SliverToBoxAdapter(
//         child: Center(child: CircularProgressIndicator()),
//       );
//     }
//     return articles.isNotEmpty
//         ? NewsListView(articles: articles)
//         : const SliverToBoxAdapter(child: EmptyState());
//   }
// }
