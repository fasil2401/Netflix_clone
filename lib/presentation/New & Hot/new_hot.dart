import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/presentation/Home/widgets/custom_button_widget.dart';
import 'package:netflix_demo/presentation/New%20&%20Hot/widgets/video_widget.dart';
import 'package:netflix_demo/services/constants.dart';
import 'package:netflix_demo/services/http_service.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';
import '../../core/constants.dart';
import '../Widgets/app_bar_widget.dart';
import 'widgets/coming_soon.dart';
import 'widgets/every_one.dart';
import 'package:intl/intl.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
            ],
          ),
          setWIdth,
        ],
        // bottom: TabBar(
        //     unselectedLabelColor: textwhitecolor,
        //     labelColor: textblackcolor,
        //     labelPadding:
        //         EdgeInsets.symmetric(horizontal: 25, vertical: 0),
        //     labelStyle: const TextStyle(
        //         fontSize: 18, fontWeight: FontWeight.bold),
        //     isScrollable: true,
        //     indicator: BoxDecoration(
        //       borderRadius: radius30,
        //       color: textwhitecolor,
        //     ),
        //     tabs: const [
        //       Tab(
        //         text: '🍿 Coming Soon',
        //       ),
        //       Tab(text: "👀 Everyone's Watching"),
        //       Tab(
        //         text: '🔟 Top 10',
        //       )
        //     ]),
      ),
      // body: TabBarView(
      //   children: [
      //     _buildComingSoon(context),
      //     _buildEveryOnesWatching(context),
      //     _buildTabView('Top ten'),
      //   ],
      // ),

      body: ScrollableListTabView(
        tabs: [
          ScrollableListTab(
            tab: ListTab(
              activeBackgroundColor: textwhitecolor,
              inactiveBackgroundColor: textblackcolor,
              borderRadius: BorderRadius.circular(30),
              label: "🍿  Coming soon",
            ),
            body: CustomScrollView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: FutureBuilder(
                        future: HttpServices().getUpcoming(Constants.upComing),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            List<dynamic> list = snapshot.data;
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  return ComingSoonWidget(
                                      comingsoon:
                                          'Coming On ${DateFormat('MMMM dd').format(
                                        DateTime.parse('${list[index].date}'),
                                      )}',
                                      movie: '${list[index].title}',
                                      month: DateFormat('MMM')
                                          .format(
                                            DateTime.parse(
                                              '${list[index].date}',
                                            ),
                                          )
                                          .toUpperCase(),
                                      image: '${list[index].image}',
                                      day: DateFormat('dd').format(
                                        DateTime.parse('${list[index].date}'),
                                      ),
                                      moviedisc: '${list[index].overview}',
                                      screenSize: screenSize);
                                });
                          } else {
                            return Container();
                          }
                        }),
                  ),
                ]),
          ),

          ScrollableListTab(
            
            tab: ListTab(
              
              activeBackgroundColor: textwhitecolor,
              inactiveBackgroundColor: textblackcolor,
              borderRadius: BorderRadius.circular(30),
              label: "👀 Everyone's Watching",
            ),
            body: CustomScrollView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: FutureBuilder(
                        future: HttpServices().getUpcoming(Constants.upComing),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            List<dynamic> list = snapshot.data;
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  return EveryOneWatching(
                                    movie: '${list[index].title}', 
                                    image: '${list[index].image}',
                                    moviedisc: '${list[index].overview}',);
                                });
                          } else {
                            return Container();
                          }
                        }),
                  ),
                ]),
          ),
          ScrollableListTab(
            
            tab: ListTab(
              
              activeBackgroundColor: textwhitecolor,
              inactiveBackgroundColor: textblackcolor,
              borderRadius: BorderRadius.circular(30),
              label: "Top 10",
            ),
            body: CustomScrollView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: FutureBuilder(
                        future: HttpServices().getUpcoming(Constants.upComing),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            List<dynamic> list = snapshot.data;
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  return ComingSoonWidget(
                                      comingsoon:
                                          'Coming On ${DateFormat('MMMM dd').format(
                                        DateTime.parse('${list[index].date}'),
                                      )}',
                                      movie: '${list[index].title}',
                                      month: DateFormat('MMM')
                                          .format(
                                            DateTime.parse(
                                              '${list[index].date}',
                                            ),
                                          )
                                          .toUpperCase(),
                                      image: '${list[index].image}',
                                      day: DateFormat('dd').format(
                                        DateTime.parse('${list[index].date}'),
                                      ),
                                      moviedisc: '${list[index].overview}',
                                      screenSize: screenSize);
                                });
                          } else {
                            return Container();
                          }
                        }),
                  ),
                ]),
          ),
        ],
      ),
    );
  }


  // Widget _buildComingSoon(BuildContext context) {
  //   final screenSize = MediaQuery.of(context).size;
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 10),
  //     child: ListView.builder(
  //       itemCount: 10,
  //       itemBuilder: (BuildContext context, index) =>
  //           ComingSoonWidget(screenSize: screenSize),
  //     ),
  //   );
  // }

  // Widget _buildEveryOnesWatching(BuildContext context) {
  //   final screenSize = MediaQuery.of(context).size;
  //   return ListView.separated(
  //       separatorBuilder: ((context, index) => setHeight20),
  //       itemCount: 10,
  //       itemBuilder: (BuildContext context, index) => EveryOneWatching());
  // }
}
