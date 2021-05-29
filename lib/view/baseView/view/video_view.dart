import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakla/view/baseview/controller/video_controller.dart';
import '../../../core/components/app_bar_container.dart';

class VideoView extends StatelessWidget {
  final _controller = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildAppBar(),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.all(context.height * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _controller.file == null
                        ? buildPickedVideoButton(context)
                        : Column(
                            children: [buildThumbnail(), buildVideoSize()],
                          )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget buildThumbnail() {
    return _controller.thumbnailBytes == null
        ? CircularProgressIndicator()
        : Image.memory(
            _controller.thumbnailBytes!,
            height: 100,
          );
  }

  Widget buildVideoSize() {
    if (_controller.file == null) return Container();
    final size = _controller.videoSize;

    return Column(
      children: [
        Text('Orginal Video Info',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Size: $size KB',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget buildPickedVideoButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        _controller.videoCompress();
      },
      child: Ink(
        width: context.width / 1.1,
        height: context.height / 16,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff3B4183), Color(0xff515AB6)]),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          color: Color(0xffED7917),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text('Picked Video',
              style: TextStyle(fontSize: 30, color: Colors.white)),
        ),
      ),
    );
  }

  Expanded buildAppBar() {
    return Expanded(
      flex: 1,
      child: AppBarContainer(
        child: Center(
          child: Text(
            'Video Cormpress',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
