import 'package:get/route_manager.dart';
import 'package:sakla/core/constants/navigation/navigation_constants.dart';
import 'package:sakla/view/auth/view/login/login_view.dart';
import 'package:sakla/view/auth/view/signup/sign_up_view.dart';
import 'package:sakla/view/baseview/base_view.dart';

class AppPages {
  static final pages = [
    GetPage(name: NavigationConstants.LOGIN, page: () => LoginView()),
    GetPage(name: NavigationConstants.SIGN_UP, page: () => SignUpView()),
    GetPage(name: NavigationConstants.BASE, page: () => BaseView()),
  ];
}
