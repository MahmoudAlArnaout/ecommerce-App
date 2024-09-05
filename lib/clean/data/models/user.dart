class User {
  final String? email;
  final String? password;
  final String? username;

  User({required this.email, required this.username, required this.password});

  factory User.fromMap(Map<String, dynamic> user) {
    return User(
      email: user['email'],
      password: user['password'],
      username: user['username'],
    );
  }
}
