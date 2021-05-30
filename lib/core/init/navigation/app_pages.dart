import 'package:get/route_manager.dart';
import 'package:sakla/core/constants/cache_key.dart';
import 'package:sakla/view/auth/shared/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../view/auth/view/login_view.dart';
import '../../../view/auth/view/sign_up_view.dart';
import '../../../view/baseView/base_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class AppPages {
  static final pages = [
    GetPage(name: NavigationConstants.LOGIN, page: () => LoginView()),
    GetPage(name: NavigationConstants.SIGN_UP, page: () => SignUpView()),
    GetPage(name: NavigationConstants.BASE, page: () => BaseView()),
  ];
}

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future<void> prefrenceInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
    return;
  }

  void clearAll() async {
    await _preferences!.clear();
  }

  Future setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  Future setIntValue(PreferencesKeys key, int value) async {
    await _preferences!.setInt(key.toString(), value);
  }
}
