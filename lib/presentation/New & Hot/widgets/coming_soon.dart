import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../Home/widgets/custom_button_widget.dart';
import 'video_widget.dart';


class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
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
            children: const [
              Text(
                'FEB',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                '11',
                style: TextStyle(
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
             const VideoWidget(),
              setHeight,
              Row(
                children: const [
                  Text(
                    'TALL GIRL 2',
                    style: TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  CustomButtonWidget(
                    icon: Icons.notifications_outlined,
                    title: 'Remind me',
                    iconSize: 20,
                    textSize: 12,
                  ),
                  setWIdth,
                  CustomButtonWidget(
                    icon: Icons.info_outlined,
                    title: 'Info',
                    iconSize: 20,
                    textSize: 12,
                  ),
                  setWIdth,
                ],
              ),
              setHeight,
              const Text('COming on Friday'),
              setHeight,
              const Text(
                'Tall Girl 2',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              setHeight,
              const Text(
                
                  '1960s Turkey countryside. A newly assigned teacher finds out that the solitary village is missing a school. He gets fond of the village people and especially a disabled man. The teacher helps the village to build a new school and educate the children and the disabled man.',
                  style: TextStyle(color: Colors.grey ),)
            ],
          ),
        )
      ],
    );
  }
}

