import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../basic_flutter/DataBaseConnection.dart';
import '../../basic_flutter/SqlDataBase.dart';
import '../../basic_flutter/User.dart';

class DataBaseConnectionController extends GetxController{

  SqlDataBase sqlDataBase = SqlDataBase();



  Future<User?> userVerification(String email, String password) async {
    User user=User();
    try{
      List<Map> result = await sqlDataBase.readData("select * from USERS where email='$email'");
      String?  myEmail= result[0]['email'] as String;
      String? myPassword = result[0]['password'] as String;
      String?  myUserName = result[0]['username'] as String;

      if (myEmail == email && myPassword == password) {
        user.setUser(myEmail,myUserName);
        return user;
      }
    }

    catch(e){
      return null;
    }

  }


  void insertUsers(String email , String passWord, String userName) {
    sqlDataBase.insertData("insert into USERS (email,password,username) values('$email','$passWord','$userName')");
  }










}