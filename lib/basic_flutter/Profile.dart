import 'package:ecommerce/basic_flutter/User.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
   const Profile({super.key});


  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
 // String? userName=User.getUser()?.userName;
  //String? email=User.getUser()?.email;
    @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text("profile",style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'GaMaamli',
          ),),
        ),
        body: ListView(children: [
          Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    //title:Text("username:\n $userName",style: const TextStyle(fontSize: 30,color: Colors.black),),
                      //subtitle:Text("email:\n $email",style: const TextStyle(fontSize: 20,color: Colors.grey,),),
                    trailing: IconButton(onPressed: () { TextEditingValue; },icon: const Icon(Icons.edit),),

                  ),
                ),
    ]
        )
          );
    }
  }








