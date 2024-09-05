import 'package:ecommerce/clean/data/models/user_model.dart';
import 'package:ecommerce/clean/domain/repositories/user_repositorie.dart';

import '../data_sources/user_local_data_source.dart';

class UserRepositoriesImplement extends UserRepositories {

  UserRepositoriesImplement();

  @override
  Future<User?> getUserByEmail(String email) async {
    try {
      List<Map> result = await UserLocalDataSource()
          .readData("select * from USERS where email='$email'");
      if (result.isNotEmpty) {
        return User.fromMap((result as List<Map<String, dynamic>>).first);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> createUser(String email,String password,String username) async {
    if (await UserLocalDataSource()
        .insertData("insert into USERS (email,password,username) values"
            "('$email','$password','$username')")) {
      return true;
    } else {
      return false;
    }
  }
}
