class User {
  String? username;
  String? email;
  String? password;
  String? confirmedPassword;

  User({this.username, this.email, this.password});

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String password) {
    this.password = password;
  }

  void setUsername(String username) {
    this.username = username;
  }
  void setConfirmedPassword(String confirmedPassword){
    this.confirmedPassword = confirmedPassword;
  }

  User getUser() {
    return this;
  }
}
