import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/services/constants.dart';
import 'package:netflix_demo/services/http_service.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

class MainStackCard extends StatelessWidget {
  final String api;
  final int index;
  MainStackCard({Key? key, required this.index, required this.api})
      : super(key: key);
  HttpServices http = HttpServices();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.getTopRated(api),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  // height: 250,
                  width: 130,
                  // margin:const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: radius10,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '${Constants.imageId}${snapshot.data[index].image}'),
                    ),
                  ),
                ),
               const Positioned(
                 bottom: 0,
                 top: 0,
                 left: 45,
                  child:  CircleAvatar(
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
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: 
                  Container(
                   padding:const EdgeInsets.all(8),
                    width: 130,
                    decoration:const BoxDecoration(
                       color: Colors.grey,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const[
                        Padding(
                          padding:  EdgeInsets.only(left: 8),
                          child: Icon(Icons.info_outline,size: 30,),
                        ),
                        Icon(Icons.more_vert,size: 30,)
                      ],
                    ),
                  ))
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
