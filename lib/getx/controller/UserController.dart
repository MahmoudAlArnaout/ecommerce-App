import 'package:get/get.dart';

import '../../basic_flutter/User.dart';



class UserController extends GetxController {

  final Rx<User> user = User().obs;

  void setUser(String userName , String email){
    user.value.userName=userName;
    user.value.email=email;


  }










  }



