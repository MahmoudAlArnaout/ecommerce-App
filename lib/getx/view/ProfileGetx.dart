import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/UserController.dart';

class ProfileGetx extends StatelessWidget {
  const ProfileGetx({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>(tag: "user");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'GaMaamli',
          ),
        ),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Obx(() => Text(
                "Username:\n${userController.user.value.userName}",
                style: const TextStyle(fontSize: 30, color: Colors.black),
              )),
              subtitle: Obx(() => Text(
                "Email:\n${userController.user.value.email}",
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              )),
              trailing: IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
