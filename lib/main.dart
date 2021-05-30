import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sakla/view/splashScreen/splash_screen.dart';

import 'core/constants/navigation/navigation_constants.dart';
import 'core/init/navigation/app_pages.dart';
import 'core/init/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.prefrenceInit();
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
      home: SplashScreen(), //SplashView(),
      getPages: AppPages.pages,
    );
  }
}
