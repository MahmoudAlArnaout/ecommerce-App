import 'dart:io';

import 'package:ecommerce/getx/controller/UserController.dart';
import 'package:ecommerce/getx/view/HomePageGetx.dart';
import 'package:ecommerce/getx/view/Signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/DataBaseConnectionController.dart';
import '../controller/LoginController.dart';

class LoginPageGetx extends StatelessWidget {
  LoginPageGetx({super.key});

  final DataBaseConnectionController dataBaseConnectionController =
  Get.put(DataBaseConnectionController(),tag: "DataBaseConnection");

  final UserController userController =
  Get.put(UserController(),tag: 'user');


  final LoginController loginController =
      Get.put(LoginController(Get.find<DataBaseConnectionController>(tag: "DataBaseConnection"),Get.find<UserController>(tag: "user")));



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.defaultDialog(
              title: "Close the App",
              middleText: "Are you sure?",
              textConfirm: "Yes",
              textCancel: "No",
              onConfirm: () {
                exit(0);
              },
              onCancel: () {
                Get.back();
              },
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => SegmentedButton(
                  segments: const <ButtonSegment<String>>[
                    ButtonSegment<String>(value: 'user', label: Text("User")),
                    ButtonSegment<String>(value: 'admin', label: Text("Admin")),
                  ],

                  selected: loginController.selectedRole,
                  onSelectionChanged: (newSelected){
                    loginController.updatedSelection(newSelected);
                  },
                )),

            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  width: 200,
                  height: 150,
                  child: Image.asset("images/ecommerce.webp"),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Obx(() => TextField(
                    controller: loginController.email.value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffix: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: 'ex: abc@gmail.com',
                    ),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: Obx(() => TextField(
                    controller: loginController.password.value,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffix: Icon(Icons.password),
                      labelText: 'Password',
                      hintText: 'Enter secure password',
                    ),
                  )),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                onPressed: () async {
                  if (await loginController.userCheck()){
                    Get.to(() => HomePageGetx());
                      }
                  else{
                    Get.snackbar(
                      "Error",
                      "Wrong email or password",
                      duration: Duration(seconds: 2),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(height: 130),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    Get.to(()=>Signup());
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
