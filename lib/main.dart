import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_gridlock/home.dart';

void main() {
  runApp((MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GridLock(),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.robotoSerif(
          textStyle: const TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 18,
            wordSpacing: 2
          ),
        ).fontFamily,
      ))));
}