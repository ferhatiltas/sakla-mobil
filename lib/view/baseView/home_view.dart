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
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [buildAppBar(), Expanded(flex: 4, child: Text(''))],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _testCompressFile();
      //   },
      // ),
    );
  }

  // AspectRatio(
  // child: Image(
  // image: provider ?? AssetImage('assets/image/splash.png'),
  // width: double.infinity,
  // fit: BoxFit.contain,
  // ),
  // aspectRatio: 1 / 1,
  // ),
  Expanded buildAppBar() {
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
    this.provider = provider;
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
