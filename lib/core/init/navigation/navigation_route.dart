import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sakla/core/constants/navigation/navigation_constants.dart';
import 'package:sakla/view/auth/login/login_view.dart';
import 'package:sakla/view/auth/splash_view.dart';
import 'package:sakla/view/baseView/base_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.LOGIN:
        return normalNavigate(LoginView());
      case NavigationConstants.SPLASH:
        return normalNavigate(SplshView());
      case NavigationConstants.BASE:
        return normalNavigate(BaseView());

      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
