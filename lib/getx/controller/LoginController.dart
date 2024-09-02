import 'package:ecommerce/getx/controller/UserController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../basic_flutter/User.dart';
import 'DataBaseConnectionController.dart';

class LoginController extends GetxController {
  final DataBaseConnectionController dataBaseConnectionController;
  final UserController userController;

  LoginController(this.dataBaseConnectionController, this.userController);

  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  late Set<String> selectedRole = {'user'}.obs;

  void updatedSelection(Set<String> newSelected) {
    selectedRole = newSelected;
  }

  Future<bool> userCheck() async {
    User? user = await dataBaseConnectionController.userVerification(
        email.value.text, password.value.text);

    if (user != null) {
      userController.setUser(user.userName!, user.email!);
      return true;
    } else {
      return false;
    }
  }
}
