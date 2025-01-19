//
//
// abstract class LocalStorageServices{
//  static late SharedPreference preferences;
//  static init()async{
//    preferences=await SharedPreferences.getInstance();
//  }
//  static Future<bool> setString(String key, String value)async{
//    return await preferences.setString(key, value);
//  }
//  static Future<bool> setInt(String key, String value)async{
//    return await preferences.setString(key, value);
//  }
//  static  Future<bool> setBool(String key, String value)async{
//    return await preferences.setString(key, value);
//  }
//  static  bool? getBool(String key) {
//    return preferences.getBool(key);
//  }
//  static  int? getInt(String key) {
//    return preferences.getInt(key);
//  }
//  static  String? getString(String key) {
//    return preferences.getString(key);
//  }
// }