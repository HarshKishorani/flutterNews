import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/widgets/blog_tile.dart';
import 'package:flutter_news/widgets/category_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    //Categories
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            // TODO : Check null value
                            imageUrl: categories[index].imageUrl ??
                                "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80",
                            categoryName: categories[index].categoryName ?? "Business",
                          );
                        },
                      ),
                    ),

                    //Articles
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                                url: articles[index].url,
                                imgUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                description: articles[index].description);
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
