
import 'dart:async';

import 'package:ecommerce/basic_flutter/FireBaseApi.dart';
import 'package:ecommerce/basic_flutter/LocationDetails.dart';
import 'package:ecommerce/basic_flutter/push.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';



class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();


}

class _MapScreenState extends State<MapScreen> {
  LocationDetails locationDetails=LocationDetails();
  String  deviceToken='';

  @override
  initState() {
    super.initState();
    initFireBase();
  }

  void initFireBase()  async{
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey:"AIzaSyDloXxYnADenN9lpje0MTwyOmgyJT0BTnU" ,
            appId:"1:70868667504:android:02f0475985e463e3bfb8b5" ,
            projectId:"ecommerce-761cf",
            messagingSenderId: "70868667504"
        ));
    deviceToken=(await FireBaseApi().initNotifications())! ;
  }

  Future<void> citName()async{
  try{
  List<Placemark> placeMark=await placemarkFromCoordinates(point.latitude, point.longitude);
  print(placeMark[0].postalCode);
  locationDetails.setCountry(placeMark[0].country!);
  }
  catch (e){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds:2),
        content: Text("no location found"))
    );
  }

}

  LatLng point=const LatLng(40.730610,-73.935242);
  final mapController=MapController();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text("map"),backgroundColor: Colors.blue,),
    body: FlutterMap(
      mapController: mapController,
      options: MapOptions(
        onTap: (_,newPoint) async{
         setState((){
            point=newPoint;
            citName();
          });
        },
        initialCenter:point,
        minZoom: 10.0,
        interactionOptions: const InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),

      ),
      children:[
        TileLayer(
          urlTemplate:
          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: const ['a', 'b', 'c'],
        ),
        MarkerLayer(markers: [
          Marker(
            point: point,
              height: 100,
              width: 100,
              alignment: Alignment.bottomLeft,
              child: const Icon(Icons.location_pin,color: Colors.red,size: 60,),
          )
        ]
        )
      ]
    ),
      floatingActionButton:FloatingActionButton(onPressed: () async{
        Navigator.of(context).pop(locationDetails);
        await Push.sendNotification(
            deviceToken,
            context,
            '0',
            'checkout',
            "placing order");
      },
        child: const Icon(Icons.done),) ,
  );


  }


}