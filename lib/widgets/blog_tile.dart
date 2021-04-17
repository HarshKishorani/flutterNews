import 'package:flutter/material.dart';
import 'package:news_api/views/article_view.dart';

class BlogTile extends StatelessWidget {

  final String imgUrl,title,description,url;
  BlogTile({@required this.imgUrl,@required this.title,@required this.description,@required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(
         blogUrl: url,
        )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imgUrl),),
            SizedBox(height: 6,),
            Text(title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black54
            ),),
            SizedBox(height: 8,),
            Text(description,
            style: TextStyle(
              color: Colors.grey
            ),)
          ],
        ),
      ),
    );
  }
}
