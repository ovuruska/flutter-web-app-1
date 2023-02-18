

class LoginViewModel {
  String username = '';
  String password = '';

  bool get isValid => username.isNotEmpty && password.isNotEmpty;

  setUsername(String username){
    this.username = username;
    return this;
  }

  setPassword(String password){
    this.password = password;
    return this;
  }
}