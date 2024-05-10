import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferces {
  static late SharedPreferences sharedPreferences;

  static init() async {
    //called in the main function
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<String?> getCacheData({required String key}) async {
    return sharedPreferences.getString(key);
  }

  static Future<bool> insertToCache({required String key,required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  static Future<bool> saveData({required String key, required dynamic value}) {
    if (value is String) {
      return sharedPreferences.setString(key, value);
    } else if (value is int) {
      return sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return sharedPreferences.setDouble(key, value);
    } else {
      return sharedPreferences.setBool(key, value);
    }
  }

  static Object? getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> deleteData({required String key}) {
    return sharedPreferences.remove(key);
  }
}