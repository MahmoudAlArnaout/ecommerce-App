import 'package:ecommerce/basic_flutter/LocationDetails.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerce/basic_flutter/MapScreen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CustmorDetails extends StatefulWidget {

  const CustmorDetails({super.key}) ;

  @override
  State<CustmorDetails> createState() => _CustmorDetailsState();

}
class _CustmorDetailsState extends State<CustmorDetails> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final TextEditingController _controller = TextEditingController();

   @override
  Widget build(BuildContext context) {
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
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Building Number",
                    icon: Icon(Icons.home_work_outlined),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Building Name",
                    icon: Icon(Icons.add_home_work_sharp),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Street",
                    icon: Icon(Icons.streetview),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Zip Code",
                    icon: Icon(Icons.home_work_outlined),
                  ),
                ),
                TextFormField(
                  controller:_controller,
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
            child: Text("Choose Your Payment Method", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange)),
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
                _showCheckoutDialog();
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

  void _showCheckoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Checkout"),
          content: const Text("Are you sure?"),
          actions: [
            TextButton(
              onPressed: () async{
                Navigator.of(context).pop();
                final LocationDetails location = await  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MapScreen()));
                _controller.text = location.country ?? '';
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }
}
