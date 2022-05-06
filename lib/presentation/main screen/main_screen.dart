import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/presentation/Fast%20Laugh/fast_laugh.dart';
import 'package:netflix_demo/presentation/Home/home_screen.dart';
import 'package:netflix_demo/presentation/New%20&%20Hot/new_hot.dart';
import 'package:netflix_demo/presentation/Search/search.dart';
import 'package:netflix_demo/presentation/downloads/download_screen.dart';

import 'widgets/bottom_navigation.dart';

class ScreenMain extends StatelessWidget {
   ScreenMain({Key? key}) : super(key: key);

  final _pages =[
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
      body: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, int value, child){
        return _pages[value];
      }),

      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
