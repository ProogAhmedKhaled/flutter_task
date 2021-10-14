import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    print("Start init");
    sharedPreferences = await SharedPreferences.getInstance();
    print("finish init");
  }

  static Future<bool> save(
      {required String key, required dynamic value}) async {
    if (value is int)
      return await sharedPreferences.setInt(key, value);
    else if (value is String)
      return await sharedPreferences.setString(key, value);
    else if (value is bool)
      return await sharedPreferences.setBool(key, value);
    else
      return await sharedPreferences.setDouble(key, value);
  }

  static get({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> clearData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
