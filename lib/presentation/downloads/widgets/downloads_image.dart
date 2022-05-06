import 'dart:math';

import 'package:flutter/material.dart';

import '../../../services/constants.dart';

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.image,
    required this.margin,
    this.angle = 0,
    required this.size,
    this.radius = 8,
  }) : super(key: key);

  final String image;
  final EdgeInsets margin;
  final double angle;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage('${Constants.imageId}$image'))),
      ),
    );
  }
}




