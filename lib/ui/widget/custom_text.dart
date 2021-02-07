import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final double fontSize;
  final String text;
  final Color color;
  final Alignment alignment;
  final double height;
  final int maxLine;

  CustomText( { this.text = '',
  this.fontSize = 16,
    this.maxLine,
    this.height=1,
  this.color = Colors.black,
  this.alignment = Alignment.topLeft,});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:alignment ,
      child: Text(text,maxLines:maxLine,style: TextStyle(fontSize: fontSize,color: color,height: height),),
    );
  }
}
