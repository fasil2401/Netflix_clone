import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../Widgets/main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const  MainTitle(title: 'Top 10 Tv shows in india today'),
        setHeight,
        LimitedBox(
          maxHeight: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) {
              return  NumberCard(index: index,);
            }),
          ),
        )
      ],
    );
  }
}
