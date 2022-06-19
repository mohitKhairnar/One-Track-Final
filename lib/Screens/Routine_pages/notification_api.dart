import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationApi{
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();
  static Future _notificationDetails() async{
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'your channel id',
        'your channel name',
          'your channel description',
          importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }
  static Future init({bool initScheduled = false})async{

    final settings = InitializationSettings(
        android: AndroidInitializationSettings("OneTrack"),
    iOS: IOSInitializationSettings());
    await _notifications.initialize(
      settings,
      onSelectNotification: ((payload) async{
        onNotifications.add(payload);
      })
    );
  }
  static Future showNotification({
  int id = 0,
  String? title,
  String? body,
  String? payload,
})async=>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );
}