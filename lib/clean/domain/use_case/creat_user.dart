import 'package:ecommerce/clean/domain/repositories/user_repositorie.dart';

class CreateUser {
  final UserRepositories repositories;

  CreateUser({required this.repositories});

  Future<bool> addUser(String username, String email, String password) async {
    return await repositories.createUser(username,password,email);
  }


}