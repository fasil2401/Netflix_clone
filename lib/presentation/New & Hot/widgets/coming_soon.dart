import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../Home/widgets/custom_button_widget.dart';
import 'video_widget.dart';


class ComingSoonWidget extends StatelessWidget {

  final String movie;
  final String moviedisc;
  final String month;
  final String day;
  final String comingsoon;
  final String image;

   ComingSoonWidget({
    Key? key,
    required this.movie,
    required this.comingsoon,
    required this.month,
    required this.image,
    required this.day,
    required this.moviedisc,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;
    
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              Text(
                month,
                style:const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                day,
                style:const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              )
            ],
          ),
        ),
        SizedBox(
          height: 450,
          width: screenSize.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(image: image,),
              setHeight,
              Row(
                children:  [
                  SizedBox(
                    width: screenSize.width * 0.6,
                    child: Text(
                      movie,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                 const Spacer(),
                 const CustomButtonWidget(
                    icon: Icons.notifications_outlined,
                    title: 'Remind me',
                    iconSize: 20,
                    textSize: 12,
                  ),
                  setWIdth,
                 const CustomButtonWidget(
                    icon: Icons.info_outlined,
                    title: 'Info',
                    iconSize: 20,
                    textSize: 12,
                  ),
                  setWIdth,
                ],
              ),
              setHeight,
               Text(comingsoon),
              setHeight,
               Text(
                movie,
                style:const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              setHeight,
               Text(
                
                  moviedisc,
                  maxLines: 5,
                  style:const TextStyle(color: Colors.grey ),)
            ],
          ),
        )
      ],
    );
  }
}

