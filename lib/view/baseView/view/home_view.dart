import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:sakla/core/components/app_bar_container.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ImageProvider? provider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [buildAppBar(), Expanded(flex: 4, child: Text(''))],
      ),
    );
  }

  Widget buildAppBar() {
    return Expanded(
      flex: 1,
      child: AppBarContainer(
        child: Center(
          child: Text(
            'Home',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
