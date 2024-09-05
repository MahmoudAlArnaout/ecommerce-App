import 'package:ecommerce/clean/data/models/user.dart';
import 'package:ecommerce/clean/domain/repositories/user_repositorie.dart';

import '../data_sources/user_local_data_source.dart';

class UserRepositoriesImplement extends UserRepositories {
  final UserLocalDataSource userLocalDataSource;

  UserRepositoriesImplement({required this.userLocalDataSource});

  @override
  Future<bool> createUser(User user) async {
    if (await userLocalDataSource
        .insertData("insert into USERS (email,password,username) values"
            "('${user.email}','${user.password}','${user.username}')")) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<User?> getUserByEmail(String email) async {
    try {
      List<Map> result = await userLocalDataSource
          .readData("select * from USERS where email='$email'");
      if (result.isNotEmpty) {
        return User.fromMap(result as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
