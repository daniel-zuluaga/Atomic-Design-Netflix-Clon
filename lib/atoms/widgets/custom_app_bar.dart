import 'package:flutter/material.dart';
import 'package:micro_app_netflix_clon/atoms/widgets/widgets.dart';
import 'package:micro_app_netflix_clon/foundations/colors_foundation.dart';

class CustomAppBar extends StatelessWidget {

  final String imageUrlMobile;
  final String imageUrlDesktop;
  final double scroolOffset;
  const CustomAppBar({
    super.key, 
    this.scroolOffset = 0.0, 
    required this.imageUrlMobile, 
    required this.imageUrlDesktop
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color: Colors.black.withOpacity((scroolOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: _CustomAppBarMobile(imageUrl: imageUrlMobile), 
        desktop: _CustomAppBarDesktop(imageUrl: imageUrlDesktop)
      )
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {

  final String imageUrl;

  const _CustomAppBarMobile({
    super.key, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(imageUrl),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: "TV Show", 
                  onTap: () => debugPrint("TV Show")
                ),
                _AppBarButton(
                  title: "Movies", 
                  onTap: () => debugPrint("Movies")
                ),
                _AppBarButton(
                  title: "My List", 
                  onTap: () => debugPrint("My List")
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {

  final String imageUrl;

  const _CustomAppBarDesktop({
    super.key, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(imageUrl),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: "Home", 
                  onTap: () => debugPrint("My List")
                ),
                _AppBarButton(
                  title: "TV Show", 
                  onTap: () => debugPrint("TV Show")
                ),
                _AppBarButton(
                  title: "Movies", 
                  onTap: () => debugPrint("Movies")
                ),
                _AppBarButton(
                  title: "Latest", 
                  onTap: () => debugPrint("My List")
                ),
                _AppBarButton(
                  title: "My List", 
                  onTap: () => debugPrint("My List")
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => debugPrint("Search"), 
                  icon: const Icon(Icons.search_rounded),
                  color: h1Color,
                  iconSize: 28,
                  padding: EdgeInsets.zero,
                ),
                _AppBarButton(
                  title: "Kids", 
                  onTap: () => debugPrint("Kids")
                ),
                _AppBarButton(
                  title: "DVD", 
                  onTap: () => debugPrint("DVD")
                ),
                IconButton(
                  onPressed: () => debugPrint("Card Gift"), 
                  icon: const Icon(Icons.card_giftcard_rounded),
                  color: h1Color,
                  iconSize: 28,
                  padding: EdgeInsets.zero,
                ),
                IconButton(
                  onPressed: () => debugPrint("Notifications"), 
                  icon: const Icon(Icons.notifications_rounded),
                  color: h1Color,
                  iconSize: 28,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {

  final String title;
  final Function onTap;

  const _AppBarButton({
    required this.title, 
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Text(
        title, 
        style: const TextStyle(
          color: h1Color,
          fontSize: 18,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}

