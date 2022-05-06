import 'package:flutter/material.dart';
import 'package:netflix_demo/presentation/New%20&%20Hot/widgets/video_widget.dart';

import '../../../core/constants.dart';
import '../../Home/widgets/custom_button_widget.dart';

class EveryOneWatching extends StatelessWidget {
  final String movie;
  final String moviedisc;
  final String image;
  const EveryOneWatching({
    Key? key,
    required this.movie,
    required this.image,
    required this.moviedisc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        setHeight,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              setHeight,
              Text(
                moviedisc,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        setHeight50,
        VideoWidget(
          image: image,
        ),
        setHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.telegram_sharp,
              title: 'Share',
              iconSize: 30,
              textSize: 16,
            ),
            setWIdth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 30,
              textSize: 16,
            ),
            setWIdth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 30,
              textSize: 16,
            ),
            setWIdth,
          ],
        )
      ],
    );
  }
}
