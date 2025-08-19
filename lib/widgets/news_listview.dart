import 'package:flutter/material.dart';
import 'package:news_app/models/articals_model.dart';
import 'package:news_app/widgets/new_tile.dart';
import 'package:news_app/widgets/empty_state.dart';

class NewsListView extends StatelessWidget {
  final List<ArticlesModel> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return const SliverToBoxAdapter(child: EmptyState());
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => NewTile(articlesModel: articles[index]),
        childCount: articles.length,
      ),
    );
  }
}

