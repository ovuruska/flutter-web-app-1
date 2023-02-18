
class AdminLoginModel {
  bool isSignedIn = false;
  String email = "";
  String password = "";

  setEmail(String username){
    this.email = username;
    return this;
  }

  setPassword(String password){
    this.password = password;
    return this;
  }

  setSignedIn(bool isSignedIn){
    this.isSignedIn = isSignedIn;
    return this;
  }

}