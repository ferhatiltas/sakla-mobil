import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sakla/core/constants/navigation/navigation_constants.dart';
import 'package:sakla/core/init/navigation/app_pages.dart';
import 'package:sakla/core/init/theme/theme.dart';

import 'view/auth/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sakla',
      initialRoute: NavigationConstants.INITIAL,
      theme: AppTheme.instance.darkTheme,
      home: SplashView(),
      getPages: AppPages.pages,
    );
  }
}
