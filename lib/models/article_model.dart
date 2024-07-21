class ArticleModel {
  final String title;
  final String? image;
  final String? subtitle;
  final String url;

  ArticleModel(
      {required this.url,
      required this.title,
      required this.image,
      required this.subtitle});
  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      subtitle: json['description'],
      url: json['url'],
    );
  }
}
