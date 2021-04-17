import 'package:flutter/material.dart';
import 'package:news_api/helper/news.dart';
import 'package:news_api/models/article_model.dart';
import 'package:news_api/widgets/blog_tile.dart';

class CategoryNews extends StatefulWidget {

  final category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles= [];
  bool _loading = true;


  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async{
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getCategoryNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
            Text('News',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
              ),)
          ],
        ),
      ),
      body: _loading ? Center(
        child: Container(
            child: CircularProgressIndicator()),
      ) :
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (context,index){
                      return BlogTile(
                          url: articles[index].url,
                          imgUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          description: articles[index].description);
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
