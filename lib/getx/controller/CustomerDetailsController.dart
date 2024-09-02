import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/basic_flutter/LocationDetails.dart';
import 'package:ecommerce/basic_flutter/MapScreen.dart';

import '../view/MapPageGetx.dart';

class CustomerDetailsController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();


  void showCheckoutDialog() async {
     await Get.dialog(
      AlertDialog(
        title:  Text("Checkout"),
        content:  Text("Are you sure?"),
        actions: [
          TextButton(
            onPressed: () async {
              Get.back();
               LocationDetails locationDetails= await Get.to(() =>  MapPageGetx());
              countryController.text = locationDetails.getCountry() ?? '';
              streetController.text = locationDetails.getStreet() ?? '';
              zipCodeController.text = locationDetails.getZipCode() ?? '';


            },
            child: const Text("Yes"),
          ),
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: const Text("No"),
          ),
        ],
      ),
    );
  }
}
