import 'package:ecommerce/basic_flutter/CustmorDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../getx/view/CustomerDetailsPageGetx.dart';

class DetailsPage extends StatefulWidget {
  final data;
  const DetailsPage({super.key, this.data});
  @override
  State<DetailsPage> createState()=>ItemDetail();

}
class ItemDetail extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag),
              Text("Ecommerce", style: TextStyle(color: Colors.orange),),
            ]

        ),
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [
          Icon(Icons.menu),
        ],
      ),
      body: ListView(
        children: [
          Image.asset(widget.data['image']),
          Container(child:
          Text(widget.data['title'],
          textAlign: TextAlign.center,
            style: const TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 30,

            ),
          ),
          ),
          Container (
              margin: const EdgeInsets.only(top: 10),
              child:
          Text(widget.data['subTitle'],
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          )
          ),
        Container (
    margin: const EdgeInsets.only(top: 10),
    child:
    Text(widget.data['price'],
    textAlign: TextAlign.center,
    style: const TextStyle(
    fontSize: 18,
      color: Colors.orange,
    ),
    )
        ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: MaterialButton(
               color: Colors.black,
              textColor: Colors.white,
              onPressed: (){
                Get.to(()=>CustomerDetailsPageGetx());

              },
              child: const Text("add to cart"),),
          ),
        ],


      ),


    );
  }


}
