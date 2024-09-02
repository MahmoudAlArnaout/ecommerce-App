import 'package:ecommerce/basic_flutter/CustmorDetails.dart';
import 'package:ecommerce/getx/controller/CustomerDetailsController.dart';
import 'package:ecommerce/getx/controller/FlutterMapController.dart';
import 'package:ecommerce/getx/controller/NotificationController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class MapPageGetx extends StatelessWidget {
  const MapPageGetx({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController=Get.put(NotificationController());
    final  MapScreenController controller =
    Get.put(MapScreenController(notificationController));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
        backgroundColor: Colors.blue,
      ),
      body: Obx(() {
        return FlutterMap(
          mapController: controller.mapController,
          options: MapOptions(
            onTap: (_, newPoint) => controller.onMapTap(newPoint),
            initialCenter: controller.point.value,
            minZoom: 10.0,
            interactionOptions: const InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: controller.point.value,
                  height: 100,
                  width: 100,
                  alignment: Alignment.bottomLeft,
                  child: const Icon(Icons.location_pin, color: Colors.red, size: 60),
                ),
              ],
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.onFloatingActionButtonPressed(),
        child: const Icon(Icons.done),
      ),
    );
  }
}
