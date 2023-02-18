import 'package:shared_preferences/shared_preferences.dart';

class CredentialService {
  static final CredentialService instance = CredentialService._();

  CredentialService._();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set({
    required String username,
    required String password,
  }) {
    _prefs.setString("username", username);
    _prefs.setString("password", password);
  }

  clear() {
    _prefs.remove("username");
    _prefs.remove("password");
  }

  Map<String,String?> get() {
    var username = _prefs.getString("username");
    var password = _prefs.getString("password");
    return {"username": username, "password": password};
  }
}
