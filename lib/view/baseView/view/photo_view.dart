import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/components/app_bar_container.dart';

class PhotoView extends StatefulWidget {
  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildAppBar(),
          Expanded(
            flex: 4,
            child: Text(''),
          )
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Expanded(
      flex: 1,
      child: AppBarContainer(
        child: Center(
          child: Text(
            'Photo Compression',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
