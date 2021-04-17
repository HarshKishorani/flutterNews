import 'package:flutter/material.dart';
import 'package:news_api/helper/data.dart';
import 'package:news_api/helper/news.dart';
import 'package:news_api/models/article_model.dart';
import 'package:news_api/models/category_model.dart';
import 'package:news_api/widgets/category_tile.dart';
import 'package:news_api/widgets/blog_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
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
      ) 
          : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
              children: [
              
              //Categories
              Container(

                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      categoryName: categories[index].categoryName,
                    );
                },
                ),
              ),
              
              //Articles
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
