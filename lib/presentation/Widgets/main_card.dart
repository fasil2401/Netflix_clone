import 'package:flutter/material.dart';
import 'package:netflix_demo/services/constants.dart';
import 'package:netflix_demo/services/http_service.dart';

import '../../core/constants.dart';

class MainCard extends StatelessWidget {
  final String api;
  final int index;
  MainCard({Key? key, required this.index, required this.api})
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
              child: Container(
                // height: 250,
                width: 130,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: radius10,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '${Constants.imageId}${snapshot.data[index].image}'))),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
