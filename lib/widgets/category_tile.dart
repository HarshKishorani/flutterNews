import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_news/views/category_news.dart';

class CategoryTile extends StatelessWidget {

  final String imageUrl,categoryName;
  const CategoryTile({super.key, required this.imageUrl,required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryNews(category: categoryName.toLowerCase(),)
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
        ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: 60,
          width: 120,
          fit: BoxFit.cover,)
        ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6)
              ),
              child: Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
