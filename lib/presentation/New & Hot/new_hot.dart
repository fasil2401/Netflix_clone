import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/presentation/Home/widgets/custom_button_widget.dart';
import 'package:netflix_demo/presentation/New%20&%20Hot/widgets/video_widget.dart';

import '../../core/constants.dart';
import '../Widgets/app_bar_widget.dart';
import 'widgets/coming_soon.dart';
import 'widgets/every_one.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                setWIdth,
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
                setWIdth,
              ],
              bottom: TabBar(
                  unselectedLabelColor: textwhitecolor,
                  labelColor: textblackcolor,
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                  labelStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  isScrollable: true,
                  indicator: BoxDecoration(
                    borderRadius: radius30,
                    color: textwhitecolor,
                  ),
                  tabs: const [
                    Tab(
                      text: '🍿 Coming Soon',
                    ),
                    Tab(text: "👀 Everyone's Watching"),
                    Tab(
                      text: 'Top 10',
                    )
                  ]),
            ),
          ),
          body: TabBarView(children: [
            _buildComingSoon(context),
            _buildEveryOnesWatching(context),
            _buildTabView('Top ten'),
          ])),
    );
  }

  _buildTabView(String name) {
    return Center(
      child: Text(name),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) =>
            ComingSoonWidget(screenSize: screenSize),
      ),
    );
  }

  Widget _buildEveryOnesWatching(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ListView.separated(
      separatorBuilder: ((context, index) => setHeight20),
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => EveryOneWatching());
      
  }
}

