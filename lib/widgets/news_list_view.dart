import 'package:flutter/material.dart';
import 'package:mahmoud/models/article_model.dart';
import 'package:mahmoud/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: NewsTile(
            articleModel: articles[index],
          ),
        ),
      ),
    );
  }
}
