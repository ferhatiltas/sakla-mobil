import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

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

  Future<void> _imgFromCamera() async {
    try {
      var image = await ImagePicker.platform
          .pickImage(source: ImageSource.camera, imageQuality: 50);

      setState(() {
        _image = image;
      });
    } catch (e) {
      print('Error From Camera:' + e.toString());
    }
  }

  Future<void> _imgFromGallery() async {
    try {
      var image = await ImagePicker.platform
          .pickImage(source: ImageSource.gallery, imageQuality: 50);

      setState(() {
        _image = image;
      });
    } catch (e) {
      print('Error From Galery:' + e.toString());
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildAppBar(),
          Expanded(
              flex: 4,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 10, right: 5, left: 5, bottom: 10),
                child: Container(
                  height: context.height,
                  width: context.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Color(0xffFDCF09),
                            child: _image != null
                                ? Semantics(
                                    child: Image.file(File(_image!.path)),
                                    label: 'image_picker_example_picked_image')
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 100,
                                    height: 100,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Expanded buildAppBar() {
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

  Future<void> compress() async {
    final img = AssetImage('image/splash.png');
    print('pre compress');
    final config = ImageConfiguration();

    var key = await img.obtainKey(config);
    final data = await key.bundle.load(key.name);

    final beforeCompress = data.lengthInBytes;
    print('beforeCompress = $beforeCompress');

    final result =
        await FlutterImageCompress.compressWithList(data.buffer.asUint8List());

    print('after = ${result.length}');
  }

  void _testCompressFile() async {
    final img = AssetImage('assets/image/splash.png');
    print('pre compress');
    final config = ImageConfiguration();

    var key = await img.obtainKey(config);
    final data = await key.bundle.load(key.name);
    final dir = await path_provider.getTemporaryDirectory();
    print('dir = $dir');

    var file = createFile('${dir.absolute.path}/test.png');
    file.writeAsBytesSync(data.buffer.asUint8List());

    final result = await testCompressFile(file);

    if (result == null) return;

    ImageProvider provider = MemoryImage(result);
    //this.provider = provider;
    setState(() {});
  }

  Future<Uint8List?> testCompressFile(File file) async {
    final result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      quality: 5,
    );

    print(file.lengthSync());
    print((log(file.lengthSync()) / log(1024)).floor());
    print(result?.length);
    return result;
  }

  File createFile(String path) {
    final file = File(path);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    return file;
  }
}
