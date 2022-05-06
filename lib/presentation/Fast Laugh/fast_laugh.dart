import 'package:flutter/material.dart';
import 'package:netflix_demo/presentation/Fast%20Laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {

  const ScreenFastLaugh({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            10,
            (index) {
              return VideoLIstItem(index: index,);
            },
          ),
        ),
      ),
    );
  }
}
