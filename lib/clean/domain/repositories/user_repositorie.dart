import '../../data/models/user.dart';

abstract class UserRepositories {
  Future<void> createUser(User user);

  Future<User?> getUserByEmail(String email);
}
