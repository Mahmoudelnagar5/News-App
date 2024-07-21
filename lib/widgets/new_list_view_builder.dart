import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mahmoud/models/article_model.dart';
import 'package:mahmoud/services/newa_service.dart';
import 'package:mahmoud/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  final String categoryName;
  const NewsListViewBuilder({
    super.key,
    required this.categoryName,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  List<ArticleModel> articles = [];
  bool isLoading = true;
  // ignore: prefer_typing_uninitialized_variables
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(categoryName: widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
