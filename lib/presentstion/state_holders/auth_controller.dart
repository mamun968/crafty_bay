
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? _accessToken;

  static String? get accessToken => _accessToken;

  static Future<void> setAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_Token', token);
    _accessToken = token;
  }

  static Future<void> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('access_Token');
  }
  static Future<void> clearAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static bool get isLoggedIn {
    return _accessToken != null;
  }
}
