import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constants.dart';
import 'package:netflix_demo/presentation/Home/widgets/main_background_card.dart';
import 'package:netflix_demo/presentation/Home/widgets/number_card.dart';
import 'package:netflix_demo/presentation/Widgets/main_title.dart';

import '../Widgets/main_card.dart';
import 'widgets/custom_button_widget.dart';
import 'widgets/main_title_card.dart';
import 'widgets/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: const [
                      MainBackground(),
                      MainTitleCard(
                        title: 'Released in Past year',
                      ),
                      setHeight,
                      MainTitleCard(
                        title: 'Trending Now',
                      ),
                      setHeight,
                      NumberTitleCard(),
                      setHeight,
                      MainTitleCard(
                        title: 'Tense Dramas',
                      ),
                      setHeight,
                      MainTitleCard(
                        title: 'South indian movies',
                      )
                    ],
                  ),
                  scrollNotifier.value
                      ? AnimatedContainer(
                        duration: const Duration(microseconds: 1000),
                        child: Container(
                            width: double.infinity,
                            height: 95,
                            color: Colors.black.withOpacity(0.3),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://www.edigitalagency.com.au/wp-content/uploads/Netflix-N-Symbol-logo-red-transparent-RGB-png.png',
                                      width: 70,
                                      height: 70,
                                    ),
                                    const Spacer(),
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
                                    setWIdth
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children:  [
                                   const Text('TV Shows', style: HomeTopTextStyle),
                                  const  Text('Movies', style: HomeTopTextStyle),
                                    Row(
                                      children:const [
                                        Text('Categories', style: HomeTopTextStyle),
                                        Icon(Icons.arrow_drop_down,
                                        color: textwhitecolor,)
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                      )
                      : setHeight,
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(textwhitecolor),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: textblackcolor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: textblackcolor),
        ),
      ),
    );
  }
}
