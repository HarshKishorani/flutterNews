import 'dart:convert';
import 'package:news_api/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{

  List<ArticleModel> news = [];
  
  Future<void> getNews() async{
    String url = "newsapi.org";

    http.Response response= await http.get(Uri.https(url, "/v2/top-headlines",{"country" : "in","apiKey":"688c71d9bae84e4fae7a4b852ce8f883"}));

    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            content: element['content'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );

          news.add(articleModel);
        }
      });
    }
  }


}

class CategoryNewsClass{

  List<ArticleModel> news = [];

  Future<void> getCategoryNews(String category) async{
    String url = "newsapi.org";

    http.Response response= await http.get(Uri.https(url, "/v2/top-headlines",{"country" : "in","category" : category ,"apiKey":"688c71d9bae84e4fae7a4b852ce8f883"}));

    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            content: element['content'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );

          news.add(articleModel);
        }
      });
    }
  }


}