import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constants.dart';

class VideoLIstItem extends StatelessWidget {
  final int index;
  const VideoLIstItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  radius: 30,
                  backgroundColor: textblackcolor.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      size: 30,
                    ),
                  ),
                ),

                //right side

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://mcdn.wallpapersafari.com/medium/86/57/6FxmsH.jpg'),
                        radius: 30,
                      ),
                    ),
                    VideoActionWidget(title: 'LOL', icon: Icons.emoji_emotions),
                    VideoActionWidget(title: 'My List', icon: Icons.add),
                    VideoActionWidget(title: 'Share', icon: Icons.share),
                    VideoActionWidget(title: 'Play', icon: Icons.play_arrow)

                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(icon,
          color: textwhitecolor,
          ),
          setHeight,
          Text(title),
        ],
      ),
    );
  }
}