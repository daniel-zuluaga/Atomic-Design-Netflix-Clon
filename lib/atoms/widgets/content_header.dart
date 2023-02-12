import 'package:flutter/material.dart';
import 'package:micro_app_netflix_clon/atoms/widgets/widgets.dart';
import 'package:micro_app_netflix_clon/foundations/colors_foundation.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';

import '../models/models.dart';

class ContentHeader extends StatelessWidget {

  final Content featuredContent;

  const ContentHeader({
    super.key, 
    required this.featuredContent, 
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _CustomContentHeaderMobile(featuredContent: featuredContent), 
      desktop: _CustomContentHeaderDesktop(featuredContent: featuredContent,)
    );
  }
}

class _CustomContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _CustomContentHeaderMobile({
    required this.featuredContent
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                featuredContent.imageUrl,
              ),
              fit: BoxFit.cover
            )
          ),
        ),
        Container(
          height: 600,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
            )
          ),
        ),
        Positioned(
          bottom: 160,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl!),
          )
        ),
        Positioned(
          left: 60,
          right: 60,
          bottom: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: "My List",
                onTap: () => debugPrint("My List")
              ),
              ElevatedButton.icon(
                label: const Text(
                  "Play",
                  style: TextStyle(
                    color: iconColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                  ),
                ),
                icon: const Icon(Icons.play_arrow_rounded, color: iconColor,),
                onPressed: (){
                  final Content contentUrl = featuredContent;
                  launchUrlString(contentUrl.urlInternetTrailer!);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    h1Color
                  )
                ),
              ),
              VerticalIconButton(
                icon: Icons.info_outline_rounded,
                title: "info",
                onTap: () => debugPrint("info")
              ),
            ],
          ),
        )
      ]
    );
  }
}




class _CustomContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  const _CustomContentHeaderDesktop({
    required this.featuredContent
  });

  @override
  _CustomContentHeaderDesktopState createState() => _CustomContentHeaderDesktopState();
}

class _CustomContentHeaderDesktopState extends State<_CustomContentHeaderDesktop> {
  late VideoPlayerController _videoController;
  late Content content;

  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.network(widget.featuredContent.videoUrl!)
          ..initialize().then((_) => setState(() {}))
          ..setVolume(0)
          ..play();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized
                ? _videoController.value.aspectRatio
                : 2.344,
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1.0,
            child: AspectRatio(
              aspectRatio: _videoController.value.isInitialized
                  ? _videoController.value.aspectRatio
                  : 2.344,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 60,
            right: 60,
            bottom: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(widget.featuredContent.titleImageUrl!),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.featuredContent.description!,
                  style: const TextStyle(
                    color: h1Color,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: shadowsColor,
                        offset: Offset(2.0, 4.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    ElevatedButton.icon( 
                      onPressed: () {
                        final contentUrl = content;
                        launchUrlString(contentUrl.urlInternetTrailer!);
                      },
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        color: iconColor,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          h1Color
                        )
                      ),
                      label: const Text(
                        'Play',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                   ButtonIconWidget(
                      onTap: (){},
                      childButton: const Icon(
                        Icons.play_arrow_rounded,
                        color: iconColor,
                      ),
                      colorButton: buttonColor,
                      labelButton: const Text(
                        'More Info',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    if (_videoController.value.isInitialized)
                      IconButton(
                        icon: Icon(
                          _isMuted ? Icons.volume_off : Icons.volume_up,
                        ),
                        color: iconColorDefault,
                        iconSize: 30.0,
                        onPressed: () => setState(() {
                          _isMuted
                              ? _videoController.setVolume(100)
                              : _videoController.setVolume(0);
                          _isMuted = _videoController.value.volume == 0;
                        }),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


