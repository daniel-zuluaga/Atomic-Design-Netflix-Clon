import 'package:flutter/material.dart';
import 'package:micro_app_netflix_clon/atoms/models/models.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Previews extends StatelessWidget {

  final String title;
  final List<Content> contentList;
  final TextStyle? styleTitle;

  const Previews({
    super.key, 
    required this.title, 
    required this.contentList, 
    this.styleTitle
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            title,
            style: styleTitle ?? const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              final Content contentUrl = content;
              return GestureDetector(
                onTap: () {
                  launchUrlString(contentUrl.urlInternetTrailer!);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: content.color!, width: 4
                        )
                      ),
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.black87,
                            Colors.black45,
                            Colors.transparent
                          ],
                          stops: [0, 0.25, 1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: content.color!, width: 4
                        )
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        height: 60,
                        child: Image.asset(content.titleImageUrl!),
                      )
                    )
                ]),
              ); 
            }
          ),
        )
      ],
    );
  }
}