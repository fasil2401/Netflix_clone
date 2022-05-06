import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constants.dart';
import 'package:netflix_demo/services/constants.dart';
import 'package:netflix_demo/services/http_service.dart';

import 'title.dart';

const imageUrl = 'https://mcdn.wallpapersafari.com/medium/86/57/6FxmsH.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Search',
        ),
        setHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) =>  TopSearchItemTile(index: index,),
              separatorBuilder: (ctx, index) => setHeight20,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final int index;
  const TopSearchItemTile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: HttpServices().getUpcoming(Constants.upComing),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Row(
              children: [
                Container(
                  width: screenWidth * 0.35,
                  height: 70,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${Constants.imageId}${snapshot.data[index].image}'),
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
                    child: Icon(
                      CupertinoIcons.play_fill,
                      color: textwhitecolor,
                    ),
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
