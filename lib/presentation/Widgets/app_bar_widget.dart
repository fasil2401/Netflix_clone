import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_demo/core/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        setWIdth,
        Text(title, 
        style:const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
       const Spacer(),
       const Icon(Icons.cast, color: Colors.white,
        size: 30,), 
        setWIdth,
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
        setWIdth,
      ],
    );
  }
}