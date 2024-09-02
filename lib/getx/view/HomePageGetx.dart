import 'package:ecommerce/basic_flutter/DetailsPage.dart';
import 'package:ecommerce/basic_flutter/LoginPage.dart';
import 'package:ecommerce/getx/controller/HomeController.dart';
import 'package:ecommerce/getx/controller/UserController.dart';
import 'package:ecommerce/getx/view/ApiDataPageGetx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'LapTopPageGetx.dart';
import 'ProfileGetx.dart';





class HomePageGetx extends StatelessWidget {
  final HomeController controller =
  Get.put(HomeController(),tag: "home");
  final UserController userController =
            Get.find<UserController>(tag: "user");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Home",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: const Icon(Icons.laptop),
                child: InkWell(
                  onTap: () {
                    Get.to(() => LapTopPageGetx());
                  },
                  child: const Text("Laptop"),
                ),
              ),
              Tab(
                icon: const Icon(Icons.api),
                child: InkWell(
                  onTap: () {
                    Get.to(() => const ApiDataPageGetx());
                  },
                  child: const Text("API Data"),
                ),
              ),
              const Tab(icon: Icon(Icons.electric_bike), child: Text("Bike")),
              const Tab(icon: Icon(Icons.mobile_friendly), child: Text("Mobile")),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        userController.user.value.email.toString(),
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      subtitle: Text(
                        userController.user.value.userName! ,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: const Icon(Icons.person),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ListTile(
                    title: const Text("Home"),
                    trailing: IconButton(
                      onPressed: () {
                        Get.to(() =>  HomePageGetx());
                      },
                      icon: const Icon(Icons.home),
                    ),
                  ),
                  ListTile(
                    title: const Text("Profile"),
                    trailing: IconButton(
                      onPressed: () {
                        Get.to(() => const ProfileGetx());
                      },
                      icon: const Icon(Icons.person),
                    ),
                  ),
                  ListTile(
                    title: const Text("Contact Us"),
                    subtitle: const Text(
                      "077798574",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // Add action for contact us
                      },
                      icon: const Icon(Icons.phone),
                    ),
                  ),
                  ListTile(
                    title: const Text("Dark Mode"),
                    trailing: IconButton(
                      onPressed: controller.changeTheme,
                      icon: const Icon(Icons.dark_mode),
                    ),
                  ),
                  ListTile(
                    title: const Text("Logout"),
                    trailing: IconButton(
                      onPressed: () {
                        Get.to(() => const Loginpage());
                      },
                      icon: const Icon(Icons.logout),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Image.asset("images/123.jpg"),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Best Selling",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Obx(() => GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 250),
                itemCount: controller.items.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => DetailsPage(data:controller.items[i] ,));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey,
                            child: Image.asset(controller.items[i]["image"]),
                          ),
                          Text(
                            controller.items[i]['title'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            controller.items[i]['subTitle'],
                            style: const TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Text(
                            controller.items[i]['price'],
                            style: const TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
