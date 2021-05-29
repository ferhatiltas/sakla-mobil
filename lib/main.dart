import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sakla/view/baseview/base_view.dart';

import 'core/constants/navigation/navigation_constants.dart';
import 'core/init/navigation/app_pages.dart';
import 'core/init/theme/theme.dart';

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
      home: BaseView(),
      getPages: AppPages.pages,
    );
  }
}
