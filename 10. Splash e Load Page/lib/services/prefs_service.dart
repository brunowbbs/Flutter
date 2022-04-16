import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const String _key = "key";

  static save(String user) async {
    //getInstance é um singleton (mesma instancia sempre)
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      _key,
      jsonEncode(
        {"user": user, "isAuth": true},
      ),
    );
  }

  static Future<bool> isAuth() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonResult = prefs.getString(_key);

    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);
      return mapUser['isAuth'] ? true : false;
    }

    return false;
  }

  static logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
