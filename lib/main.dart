import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sakla/view/auth/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sakla',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: SplshView(),
    );
  }
}
