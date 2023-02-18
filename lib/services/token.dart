import 'package:shared_preferences/shared_preferences.dart';

class TokenService  {

  static final TokenService instance = TokenService._();
  static late SharedPreferences _prefs;


  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  TokenService._();

  set(String token)  {
    _prefs.setString('token', token);
  }

  clear() {
    _prefs.remove('token');
  }

  String? get()  {
    return _prefs.getString('token');
  }
}
