import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get token {
    return _prefs.getString('token') ?? 'empty';
  }

  set token(String token) {
    _prefs.setString('token', token);
  }

  get userId {
    return _prefs.getString('userId') ?? 'empty';
  }

  set userId(int userId) {
    _prefs.setString('userId', userId.toString());
  }
}
