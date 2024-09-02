import 'package:ecommerce/basic_flutter/SqlDataBase.dart';
import 'package:ecommerce/basic_flutter/User.dart';

class DatabaseConnection {
  SqlDataBase sqlDataBase = SqlDataBase();

  Future<User?> userVerification(String email, String password) async {
    User user = User();
    try {
      List<Map> result = await sqlDataBase
          .readData("select * from USERS where email='$email'");
      String? myEmail = result[0]['email'] as String;
      String? myPassword = result[0]['password'] as String;
      String? myUserName = result[0]['username'] as String;

      if (myEmail == email && myPassword == password) {
        user.setUser(myEmail, myUserName);
        return user;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> insertUsers(
      String email, String passWord, String userName) async {
    if (await sqlDataBase.insertData(
        "insert into USERS (email,password,username) values('$email','$passWord','$userName')")) {
      return true;
    } else {
      return false;
    }
  }
}
