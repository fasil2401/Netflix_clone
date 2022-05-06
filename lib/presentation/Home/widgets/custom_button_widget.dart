import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;
  const CustomButtonWidget({
    Key? key,required this.icon, required this.title,this.iconSize=30,this.textSize = 18
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: textwhitecolor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize, color: textwhitecolor),
        )
      ],
    );
  }
}
