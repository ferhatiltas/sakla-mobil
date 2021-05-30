import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  var userEmail;

  Future<String> saveDataPrefs(var email) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('sharedEmail', email.toString());
    return 'Data Save Completed';
  }

  Future<String> bringSharedPrefs() async {
    var prefs = await SharedPreferences.getInstance();

    userEmail = prefs.getString('sharedEmail');
    //  print('Shared email $userEmail');

    return 'Completed';
  }

  Future<String> deleteSharePrefsData() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('dasdsadasd');

    return 'Completed';
  }
}
