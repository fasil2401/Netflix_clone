import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constants.dart';
import 'package:video_player/video_player.dart';

class VideoLIstItem extends StatefulWidget {
  final int index;
  final String url;
  const VideoLIstItem({Key? key, required this.index, required this.url})
      : super(key: key);

  @override
  State<VideoLIstItem> createState() => _VideoLIstItemState();
}

class _VideoLIstItemState extends State<VideoLIstItem> {
  VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);
    _controller!.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      _controller!.play().then((value) => _controller!.setLooping(true));
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: _controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                )
              : Container(
                  color: Colors.black,
                  child: const Center(
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator()))),
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://mcdn.wallpapersafari.com/medium/86/57/6FxmsH.jpg'),
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
  const VideoActionWidget({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: textwhitecolor,
          ),
          setHeight,
          Text(title),
        ],
      ),
    );
  }
}
