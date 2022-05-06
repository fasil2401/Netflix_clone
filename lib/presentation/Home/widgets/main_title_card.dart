import 'package:flutter/material.dart';
import 'package:netflix_demo/services/constants.dart';

import '../../../core/constants.dart';
import '../../Widgets/main_card.dart';
import '../../Widgets/main_title.dart';


class MainTitleCard extends StatelessWidget {
  final String title;
  final String api;
  const MainTitleCard({
    Key? key,required this.title,required this.api
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         MainTitle(title: title),
        setHeight,
        LimitedBox(
          maxHeight: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) {
              return  MainCard(index: index,api: api,);
            }),
          ),
        )
      ],
    );
  }
}

