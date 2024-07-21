import 'package:dio/dio.dart';
import 'package:mahmoud/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);
  Future<List<ArticleModel>> getNews({required String categoryName}) async {
    try {
      var response = await dio.get(
          'https://saurav.tech/NewsAPI/top-headlines/category/$categoryName/in.json'
          // 'https://newsapi.org/v2/top-headlines?country=us&apiKey=fb62ee8b55b44582b68a7ce101d8e793&category=$categoryName'
          );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        if (article['title'] != "[Removed]" && article['urlToImage'] != null) {
          articlesList.add(articleModel);
        }
        if (articlesList.length == 13) {
          break;
        }
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
