
import 'package:ecommerce/getx/controller/DataBaseConnectionController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {

  final DataBaseConnectionController dataBaseConnectionController;

   SignupController(this.dataBaseConnectionController) ;

  final  email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final userName = TextEditingController().obs;

  void signUp() {
    dataBaseConnectionController.insertUsers(email.value.text, password.value.text, userName.value.text);

  }



}