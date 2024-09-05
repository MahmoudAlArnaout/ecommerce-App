class UserEntity{
  final String? email;
  final String? password;
  final String username;

  UserEntity({required this.email,required this.password,required this.username});

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      email: map['email'] as String,
      password: map['password'] as String,
      username: map['username'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'username': username,
    };
  }



}