import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakla/core/components/app_bar_container.dart';
import 'package:sakla/core/extension/context_extension.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class PhotoView extends StatefulWidget {
  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  PickedFile? _image;

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
