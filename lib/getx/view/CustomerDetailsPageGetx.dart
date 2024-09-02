import 'package:ecommerce/getx/controller/FlutterMapController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controller/CustomerDetailsController.dart';

class CustomerDetailsPageGetx extends StatelessWidget {
   CustomerDetailsPageGetx({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomerDetailsController controller = Get.put((CustomerDetailsController()));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Checkout", style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 30),
          const Center(
            child: Text("Location Details",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 30),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.formKey,
            child: Column(
              children: [
                _buildTextFormField(
                  hintText: "Building Number",
                  icon: Icons.home_work_outlined,
                ),
                _buildTextFormField(
                  hintText: "Building Name",
                  icon: Icons.add_home_work_sharp,
                ),
                TextFormField(
                  controller: controller.streetController,
                  decoration: const InputDecoration(
                    hintText: "street",
                    icon: Icon(Icons.streetview),
                  ),
                ),
                TextFormField(
                  controller: controller.zipCodeController,
                  decoration: const InputDecoration(
                    hintText: "postel code",
                    icon: Icon(Icons.numbers),
                  ),
                ),
                TextFormField(
                  controller: controller.countryController,
                  decoration: const InputDecoration(
                    hintText: "Country Name",
                    icon: Icon(Icons.flag),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Center(
            child: Text(
              "Choose Your Payment Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ),
          const SizedBox(height: 30),
          _buildPaymentMethodTile(Icons.paypal, "Paypal"),
          const SizedBox(height: 10),
          _buildPaymentMethodTile(FontAwesomeIcons.googlePay, "Google Pay"),
          const SizedBox(height: 10),
          _buildPaymentMethodTile(FontAwesomeIcons.moneyBill, "Cash"),
          const SizedBox(height: 30),
          Center(
            child: MaterialButton(
              onPressed: () {
                controller.showCheckoutDialog();
              },
              color: Colors.orange,
              textColor: Colors.black,
              child: const Text("Checkout", style: TextStyle(fontSize: 25)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({required String hintText, required IconData icon}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        icon: Icon(icon),
      ),
    );
  }

  Widget _buildPaymentMethodTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(title, style: const TextStyle(fontSize: 25)),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
