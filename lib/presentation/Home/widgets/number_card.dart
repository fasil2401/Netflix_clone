import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';

import '../../../core/constants.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              // height: 250,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: radius10,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://www.wellgousa.com/sites/default/files/styles/key_art_poster/public/2019-05/812x1200.jpg?itok=P8Q567bg',
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -20,   
          child: BorderedText(
            strokeWidth: 8.0,
            strokeColor: textwhitecolor,
            child: Text('${index + 1}',
            style:const TextStyle(
              fontSize: 140,
              color: textblackcolor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              decorationColor: Colors.black
            ),
            ),
          ),
        ),
      ],
    );
  }
}
