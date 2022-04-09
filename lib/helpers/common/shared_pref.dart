/* ************************************************************************
* Directory Name: common                                                  *
* File Name: shared_pref.dart                                             *
* Created At: Saturday, 9th April 2022 8:54:25 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String prefTokens = "@tokens";
  static const String prefAuth = "@auth";

//! Clear shared preferences
  static Future<void> clear() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

//! bool type shared preferences
  static Future<void> setBool({required String key, required bool data}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(key, data);
  }

  static Future<bool> getBool({required String key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool res = pref.getBool(key) ?? false;
    return res;
  }

//! String type shared preferences
  static Future<void> setString(
      {required String key, required String data}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, data);
  }

  static Future<String> getString({required String key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String res = pref.getString(key) ?? '';
    return res;
  }
}
