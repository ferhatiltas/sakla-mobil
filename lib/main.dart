import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'core/constants/navigation/navigation_constants.dart';
import 'core/init/navigation/app_pages.dart';
import 'core/init/theme/theme.dart';
import 'view/auth/view/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
