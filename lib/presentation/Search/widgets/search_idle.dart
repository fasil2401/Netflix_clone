import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constants.dart';

import 'title.dart';

const imageUrl = 'https://mcdn.wallpapersafari.com/medium/86/57/6FxmsH.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const SearchTextTitle(title: 'Top Search',),
        setHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => setHeight20,
              itemCount: 10),
        )
      ],
    );
  }
}


class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 70,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        setWIdth,
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
                color: textwhitecolor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
        const CircleAvatar(
          backgroundColor: textwhitecolor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: textblackcolor,
            radius: 23,
            child: Icon(CupertinoIcons.play_fill, color: textwhitecolor,),
            ),
        )
      ],
    );
  }
}
