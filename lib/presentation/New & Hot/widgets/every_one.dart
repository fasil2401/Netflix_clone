import 'package:flutter/material.dart';
import 'package:netflix_demo/presentation/New%20&%20Hot/widgets/video_widget.dart';

import '../../../core/constants.dart';
import '../../Home/widgets/custom_button_widget.dart';

class EveryOneWatching extends StatelessWidget {
  const EveryOneWatching({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        setHeight,
        const Text(
          'Friends',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        setHeight,
        const Text(
          '1960s Turkey countryside. A newly assigned teacher finds out that the solitary village is missing a school. He gets fond of the village people and especially a disabled man. The teacher helps the village to build a new school and educate the children and the disabled man.',
          style: TextStyle(color: Colors.grey),
        ),
        setHeight50,
        const VideoWidget(),
        setHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const[
            CustomButtonWidget(
              icon: Icons.telegram_sharp
              ,
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
