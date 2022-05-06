import 'package:flutter/material.dart';
import 'package:netflix_demo/services/constants.dart';
import 'package:netflix_demo/services/http_service.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import 'custom_button_widget.dart';

class MainBackground extends StatelessWidget {
   MainBackground({Key? key}) : super(key: key);
HttpServices http = HttpServices();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.getTopRated(Constants.topRated),
      builder: (BuildContext context, AsyncSnapshot<dynamic>snapshot){
        if (snapshot.hasData) {
          return Stack(
            children: [
              Container(
                height: 600,
                width: double.infinity,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${Constants.imageId}${snapshot.data[14].image}'),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   const CustomButtonWidget(icon: Icons.add,title: 'My List',),
                    _playButton(),
                    const CustomButtonWidget(icon: Icons.info_outline, title: 'Info')
                  ],
                ),
              )
            ],
          );
          
        }else {
          return Container();
        }
      }
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