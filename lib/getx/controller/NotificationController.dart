import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../../basic_flutter/FireBaseApi.dart';
import '../../basic_flutter/push.dart';

class NotificationController extends GetxController {
  final RxString deviceToken = ''.obs;


  void onInit() {
    super.onInit();
    initFireBase();
  }

  Future<void> initFireBase() async {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDloXxYnADenN9lpje0MTwyOmgyJT0BTnU",
        appId: "1:70868667504:android:02f0475985e463e3bfb8b5",
        projectId: "ecommerce-761cf",
        messagingSenderId: "70868667504",
      ),
    );
    deviceToken.value = (await FireBaseApi().initNotifications())!;
  }
  Future<void> onFloatingActionButtonPressed() async {
    await Push.sendNotification(
      deviceToken.value,
      Get.context!,
      '0',
      'checkout',
      'Placing order',
    );
  }




}