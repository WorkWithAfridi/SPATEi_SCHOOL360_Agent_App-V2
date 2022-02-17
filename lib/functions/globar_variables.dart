import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var backgroundColor = Colors.white.withOpacity(.95);

Color red = Color(0xffef233c);
Color white = Color(0xffedf2f4);
Color silver = Color(0xff8d99ae);
Color black = Color(0xff001233);

TextStyle userNameTS = GoogleFonts.getFont(
  'Roboto',
  textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: black,
  ),
);

TextStyle defaultTS = GoogleFonts.getFont(
  'Roboto',
  textStyle: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w400),
);
TextStyle defaultTSWhite = GoogleFonts.getFont(
  'Roboto',
  textStyle: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w400),
);

TextStyle subtitleTS = GoogleFonts.getFont(
  'Roboto',
  textStyle: TextStyle(
      color: Colors.black87.withOpacity(.7), fontSize: 12, fontWeight: FontWeight.w400),
);

TextStyle defaultHighLightedTS = GoogleFonts.getFont(
  'Roboto',
  textStyle: TextStyle(color: red, fontSize: 14, fontWeight: FontWeight.w600),
);

TextStyle headerTSWhite = GoogleFonts.getFont(
  'Roboto',
  textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: white,
  ),
);
TextStyle headerTSBlack = GoogleFonts.getFont(
  'Roboto',
  textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.black87
  ),
);
TextStyle headerTSHighLight = GoogleFonts.getFont(
  'Roboto',
  textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: red,
  ),
);
