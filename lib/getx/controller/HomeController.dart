
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../basic_flutter/User.dart';

class HomeController extends GetxController{
 RxInt selectedIndex = 0.obs;
 List items = [
    {
      "image": "images/111.jpg",
      "title": "apple watch",
      "subTitle": "description",
      "price": "\$350"
    },
    {
      "image": "images/222.webp",
      "title": "apple watch",
      "subTitle": "description",
      "price": "\$350"
    }
  ].obs;




  void changeTheme() {
    if (Get.isDarkMode) {
      Get.changeTheme(ThemeData.light());
    }
    else {
      Get.changeTheme(ThemeData.dark());
    }
  }

  void setIndex(int index){
    selectedIndex.value=index;


  }




}