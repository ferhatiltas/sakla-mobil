import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../view/baseview/view/photo_view.dart';
import '../../view/baseview/view/profile_view.dart';
import '../../view/baseview/view/video_view.dart';

enum SelectedTab { home, photo, video, myProfile }

class BaseViewConstants {
  static BaseViewConstants? _instance;
  static BaseViewConstants get instance {
    _instance ??= _instance = BaseViewConstants._init();
    return _instance!;
  }

  BaseViewConstants._init();

//this list for battom navigation bar items
  List<DotNavigationBarItem> get navigationBarItems => [
        /// Photo
        DotNavigationBarItem(
          icon: Icon(Icons.photo),
        ),

        /// Video
        DotNavigationBarItem(
          icon: Icon(Icons.video_collection),
        ),

        /// Profile
        DotNavigationBarItem(
          icon: Icon(Icons.person),
        ),
      ];

  List<Widget> get allPage => [PhotoView(), VideoView(), ProfileView()];
}
