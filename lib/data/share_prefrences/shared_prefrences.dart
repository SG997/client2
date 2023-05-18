import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrences {
  static String _AUTH_TOKEN = "jwt_token";

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_AUTH_TOKEN, token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_AUTH_TOKEN);
  }
}