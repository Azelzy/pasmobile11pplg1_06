import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static final TextStyle title = GoogleFonts.poppins(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );
  static final TextStyle paragraph = GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: Colors.black
  );
  static final TextStyle paragraph2 = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black
  );
}