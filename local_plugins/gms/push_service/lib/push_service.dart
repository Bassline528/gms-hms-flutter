library push_service;

import 'package:push_service_interface/push_service_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class PushService implements PushServiceInterface {
  @override
  getToken() async { //TODO: implement on Error
    final fmcToken = await FirebaseMessaging.instance.getToken();
    if (fmcToken == null) return "";
    return fmcToken;
  }

  @override
  Future<void> init() async {
    await Firebase.initializeApp();
    var channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );
    await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true

    );
  }

}
