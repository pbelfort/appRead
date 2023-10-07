import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences {
  static Future<String?> get getToken async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  static Future<void> saveTokenInSharedPreferences({
    required String token,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', token);
  }

  static Future<String?> get getUuidUser async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uuid_user');
  }

  static Future<void> saveUuidUserInSharedPreferences({
    required String uuid,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uuid_user', uuid);
  }

  static Future<String?> getScoreUser(String uuidChild) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(uuidChild);
  }

  static Future<void> saveScoreUserInSharedPreferences({
    required String uuidChild,
    required String score,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(uuidChild, score);
  }

  static Future<void> deleteScoreUserInSharedPreferences({
    required String uuidChild,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(uuidChild);
  }
}
