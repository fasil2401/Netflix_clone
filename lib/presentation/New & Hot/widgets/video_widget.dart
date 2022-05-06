import 'package:flutter/material.dart';
import 'package:netflix_demo/services/constants.dart';

import '../../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String image;
  const VideoWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            '${Constants.imageId}$image',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: textblackcolor.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
