import 'package:flutter/material.dart';

class CustomText {
  static Text sfProRounded(String text,
      {required FontWeight fontWeight,
      required double size,
      required Color color,
      double? height}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'SFProRounded',
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}
