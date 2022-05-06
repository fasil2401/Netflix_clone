import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/services/constants.dart';
import 'package:netflix_demo/services/http_service.dart';

import '../../../core/constants.dart';

class NumberCard extends StatelessWidget {
  final int index;
  final String api;
   NumberCard({Key? key, required this.index, required this.api})
      : super(key: key);
  HttpServices http = HttpServices();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: http.getTopRated(api),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 40,
                      height: 150,
                    ),
                    Container(
                      // height: 250,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: radius10,
                        image:  DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            '${Constants.imageId}${snapshot.data[index].image}',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 13,
                  bottom: -20,
                  child: BorderedText(
                    strokeWidth: 8.0,
                    strokeColor: textwhitecolor,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                          fontSize: 140,
                          color: textblackcolor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          decorationColor: Colors.black),
                    ),
                  ),
                ),
              ],
            );
          }else{
            return Container();
          }
        });
  }
}
