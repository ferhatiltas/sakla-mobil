import 'package:flutter/material.dart';

import 'view/auth/splash_view.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sakla',
      theme: ThemeData(),
      home: SplshView(),

    );
  }
}
