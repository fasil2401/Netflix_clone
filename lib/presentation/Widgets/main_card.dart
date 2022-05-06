import 'package:flutter/material.dart';

import '../../core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 250,
        width: 130,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: radius10,
            image:const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.wellgousa.com/sites/default/files/styles/key_art_poster/public/2019-05/812x1200.jpg?itok=P8Q567bg'))),
      ),
    );
  }
}
