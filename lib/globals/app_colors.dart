import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xffFFFFFF);
  static const Color swamp = Color(0xff001D28);
  static const Color astronautBlue = Color(0xff00425A);
  static const Color daintree = Color(0xff011E29);
  static const Color shamrock = Color(0xff2DC59F);
  static const Color tango = Color(0xFFF17D23);
  static const Color rajah = Color(0xffFBB668);
  static const Color musturd = Color(0xffFFD449);
  static const Color eden = Color(0xff16624F);
  static const Color emerald = Color(0xff1F8A70);
  static const Color roman = Color(0xffDC5F5F);

  static const globalGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      swamp,
      astronautBlue,
    ],
  );
}
