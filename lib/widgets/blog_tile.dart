import 'package:flutter/material.dart';
import 'package:flutter_news/views/article_view.dart';

class BlogTile extends StatelessWidget {

  final String imgUrl,title,description,url;
  const BlogTile({super.key, required this.imgUrl,required this.title,required this.description,required this.url});

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
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imgUrl),),
            const SizedBox(height: 6,),
            Text(title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black54
            ),),
            const SizedBox(height: 8,),
            Text(description,
            style: const TextStyle(
              color: Colors.grey
            ),)
          ],
        ),
      ),
    );
  }
}
