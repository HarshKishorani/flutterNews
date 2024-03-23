class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  ArticleModel(
      {required this.author,
      required this.title,
      required this.url,
      required this.urlToImage,
      required this.description,
      required this.content});
}
