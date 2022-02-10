import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var backgroundColor = Colors.white.withOpacity(.95);

Color red = Color(0xffef233c);
Color white = Color(0xffedf2f4);
Color silver = Color(0xff8d99ae);
Color black = Color(0xff001233);

TextStyle userNameTS = GoogleFonts.getFont(
  'Open Sans',
  textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: black,
  ),
);

TextStyle defaultTS = GoogleFonts.getFont(
  'Open Sans',
  textStyle: TextStyle(color: black, fontSize: 14, fontWeight: FontWeight.w400),
);
TextStyle defaultTSWhite = GoogleFonts.getFont(
  'Open Sans',
  textStyle: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w400),
);

TextStyle subtitleTS = GoogleFonts.getFont(
  'Open Sans',
  textStyle: TextStyle(
      color: black.withOpacity(.7), fontSize: 12, fontWeight: FontWeight.w400),
);

TextStyle defaultHighLightedTS = GoogleFonts.getFont(
  'Open Sans',
  textStyle: TextStyle(color: red, fontSize: 14, fontWeight: FontWeight.w600),
);

TextStyle headerTSWhite = GoogleFonts.getFont(
  'Open Sans',
  textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: white,
  ),
);
TextStyle headerTSBlack = GoogleFonts.getFont(
  'Open Sans',
  textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: black,
  ),
);
TextStyle headerTSHighLight = GoogleFonts.getFont(
  'Open Sans',
  textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: red,
  ),
);
