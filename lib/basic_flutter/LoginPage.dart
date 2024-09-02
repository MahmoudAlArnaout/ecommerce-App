import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DataBaseConnection.dart';
import 'HomePage.dart';
import 'SignUp.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  DatabaseConnection dataBaseConnection = DatabaseConnection();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Set<String> _selected = {'user'};

  void updatedSelection(Set<String> newSelected) {
    setState(() {
      _selected = newSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("close tha App"),
                  content: const Text("are you sure"),
                  actions: [
                    TextButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => exit(0)));
                    },
                      child: const Text("yes"),),
                    TextButton(onPressed: () {
                      Navigator.of(context).pop();
                    },
                      child: const Text("no"),)
                  ],
                );
              });
        }
          , icon: const Icon(Icons.arrow_back),),
        title: const Text("Login"),
      ),
      body:
      SingleChildScrollView(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SegmentedButton(
              onSelectionChanged: updatedSelection,
              segments:
              const <ButtonSegment<String>>[
                ButtonSegment<String>(
                    value: 'user',
                    label: Text("user")
                ),
                ButtonSegment<String>(
                    value: 'admin',
                    label: Text("admin")
                )
              ],
              selected: _selected,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    width: 200,
                    height: 150,
                    child: Image.asset("images/ecommerce.webp")
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffix: Icon(Icons.email),
                    labelText: 'Email',
                    hintText: 'ex abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffix: Icon(Icons.password),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),

              ),
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
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: MaterialButton(
                onPressed: () async {
                  //if (await dataBaseConnection.userVerification(email.text, password.text)){
                  //SharedPreferences pref =await SharedPreferences.getInstance();
                  //Get.to(Homepage());
                  // }
                  // else {
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //   duration: Duration(seconds:2),
                  // content: Text("wrong email or password")));
                },

                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            Row(
              children: [
                const Text('Dont have an account ?'),
                TextButton(onPressed: () {
                  Navigator
                      .of(context)
                      .push(MaterialPageRoute(
                      builder: (context) => const Signup()));

                  },
                    child: const Text(
                      "sign up", style: TextStyle(color: Colors.blue),)),
              ],
            )

          ],
        ),
      ),
    );
  }
}

