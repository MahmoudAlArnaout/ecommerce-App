import 'package:ecommerce/clean/domain/repositories/user_repositorie.dart';

import '../../data/models/user.dart';

class GetUserByEmail {
  final UserRepositories repositories;

  GetUserByEmail({required this.repositories});

  Future<User?> execute(String email) async {
    return await repositories.getUserByEmail(email);
  }
}
