import 'package:flutter/material.dart';
import 'package:micro_app_netflix_clon/atoms/models/models.dart';
import 'package:micro_app_netflix_clon/foundations/colors_foundation.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContentList extends StatelessWidget {

  final String title;
  final List<Content> contentList;
  final bool? isOriginals; 
  final TextStyle? styleTitle;

  const ContentList({
    super.key, 
    required this.title, 
    required this.contentList, 
    this.isOriginals = false, 
    this.styleTitle
  });

  @override
  Widget build(BuildContext context) {
    Content content;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              title,
              style: styleTitle ?? const TextStyle(
                color: h1Color,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: isOriginals! ? 500 : 220,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12
              ),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: () {
                    launchUrlString(content.urlInternetTrailer!);
                  } ,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: isOriginals! ? 400 : 200,
                    width: isOriginals! ? 300 : 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(content.imageUrl),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                );
              }
            ),
          )
        ]
      ),
    );
  }
}