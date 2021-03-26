import 'package:flutter/material.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: SplshView(),
    );
  }
}
