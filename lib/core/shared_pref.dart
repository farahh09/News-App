import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late final SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveTheme(bool flag) async {
    return await prefs.setBool('theme', flag);
  }

  static bool? getTheme() {
    return prefs.getBool('theme');
  }
}
