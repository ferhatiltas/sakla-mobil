import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

class VideoController extends GetxController {
  var file;
  Rx<Uint8List>? thumbnailBytess;
  get thumbnailBytes => thumbnailBytess!.value;

  set thumbnailBytes(thumbnailBytes) => thumbnailBytess!.value = thumbnailBytes;

  var videoSizes = 0.obs;
  get videoSize => videoSizes.value;
  set videoSize(value) => videoSizes.value = value;

  Future videoCompress() async {
    final picker = ImagePicker();
    var pickedFile = await picker.getVideo(source: ImageSource.gallery);
    file = File(pickedFile!.path);
    if (file == null) {
      return;
    }
  }

  Future generateThumbnail(File file) async {
    final thumbNailBytesa = await VideoCompress.getByteThumbnail(file.path);
    thumbnailBytes = thumbNailBytesa;
  }

  Future getVideoSize(File file) async {
    final size = await file.length();
    videoSize = size;
  }
}
