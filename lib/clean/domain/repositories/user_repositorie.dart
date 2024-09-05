import '../../data/models/user_model.dart';

abstract class UserRepositories {
  Future<bool> createUser(String email,String password,String username);

  Future<User?> getUserByEmail(String email);
}
