import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle header = GoogleFonts.openSans(
    fontSize: 18,
    color: Colors.white,
  );

  static TextStyle h1(Color color) {
    return GoogleFonts.openSans(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle subHeader = GoogleFonts.openSans(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle body(Color color) {
    return GoogleFonts.openSans(
      fontSize: 16,
      color: color,
    );
  }

  static TextStyle captiontitlebold(Color color) {
    return GoogleFonts.openSans(
      fontSize: 20,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle captionsubtitle = GoogleFonts.openSans(
    fontSize: 18,
    color: Colors.grey,
  );

  static TextStyle caption = GoogleFonts.openSans(
    fontSize: 12,
    color: Colors.grey,
  );
}
