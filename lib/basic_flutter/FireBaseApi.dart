import 'package:firebase_messaging/firebase_messaging.dart';

class FireBaseApi {
  final _fireBaseMassaging = FirebaseMessaging.instance;

  Future<String?> initNotifications() async {
    await _fireBaseMassaging.requestPermission();
    String? token = await _fireBaseMassaging.getToken();
    return token;
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    } else {}
  }

  Future handleBackGroundMessage() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
