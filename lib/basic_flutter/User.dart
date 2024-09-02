class User {
  String? userName;
  String? email;

  User({this.userName, this.email});

  void setUser(String email, String userName) {
    this.email = email;
    this.userName = userName;
  }

User getUser() {
    return this;

  }
}
