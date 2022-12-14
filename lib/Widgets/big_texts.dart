import 'package:flutter/material.dart';

class BigTexts extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
BigTexts({ Key? key, this.color = const Color(0xFF332d2b),  required this.text, this.overFlow= TextOverflow.ellipsis, this.size=20 }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400
      )
    );
  }
}