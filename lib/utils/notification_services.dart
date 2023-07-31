import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class NotificationServices {
  static final notificationservice = NotificationServices._();

  NotificationServices._();

  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('appicon');
    DarwinInitializationSettings iOSInit = DarwinInitializationSettings();

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInit, iOS: iOSInit);

    await notificationsPlugin.initialize(initializationSettings);
  }

  void simpleNotification() {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      "1",
      "simple",
      priority: Priority.high,
      importance: Importance.max,
    );

    DarwinNotificationDetails iOSDetails = DarwinNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails, iOS: iOSDetails);

    notificationsPlugin.show(
        3,
        "Simple Testing",
        "The item you selected is Deleted From the FireStore",
        notificationDetails);
  }

  void soundNotification() {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        "2", "sound",
        priority: Priority.high,
        importance: Importance.max,
        sound: RawResourceAndroidNotificationSound('ring1'));

    DarwinNotificationDetails iOSDetails = DarwinNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails, iOS: iOSDetails);

    notificationsPlugin.show(
        3,
        "sound Testing",
        "The item you selected is Deleted From the FireStore",
        notificationDetails);
  }
  Future<Uint8List> _getByteArrayFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }
  Future<void> bigPictureNotification() async {


    Uint8List img = await _getByteArrayFromUrl("https://img.etimg.com/thumb/msid-100935937,width-538,height-372,imgsize-216084,overlay-economictimes/photo.jpg");

    ByteArrayAndroidBitmap bigImage = ByteArrayAndroidBitmap(img);

    BigPictureStyleInformation big =
    BigPictureStyleInformation(bigImage,
        contentTitle: 'Imge testing',
        htmlFormatContentTitle: true,
        summaryText: 'product add',
        htmlFormatSummaryText: true);

    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        "4", "picture Notification",
        priority: Priority.high, importance: Importance.high,styleInformation: big);
    NotificationDetails notificationDetails =
    NotificationDetails(android: androidDetails);
    await notificationsPlugin.show(
        4, "Picture Add", "Picture Add Successfully", notificationDetails);
  }
}
