/* ************************************************************************
* Directory Name: config                                                  *
* File Name: notification_service.dart                                    *
* Created At: Sunday, 10th April 2022 9:39:18 pm                          *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static const channelId = '123';

//initialize flutter notification plugin
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

//Listening notifications
  static final onNotifications = BehaviorSubject<String?>();

//initilize method for notifications
  static Future<void> init({bool initSchedule = false}) async {
    const AndroidInitializationSettings androidSetting =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const IOSInitializationSettings iosSetting = IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const InitializationSettings initialSetting = InitializationSettings(
      android: androidSetting,
      iOS: iosSetting,
      macOS: null,
    );

    if (initSchedule) {
      tz.initializeTimeZones();
      final location = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(location));
    }

    final details =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      onNotifications.add(details.payload);
    }

    await flutterLocalNotificationsPlugin.initialize(
      initialSetting,
      onSelectNotification: (String? payload) async {
        onNotifications.add(payload);
      },
    );
  }

// Notification details in ios and android
  static Future _notificationDetails() async {
    return const NotificationDetails(
      iOS: IOSNotificationDetails(
        presentSound: true,
      ),
      android: AndroidNotificationDetails(
        channelId,
        'channel name',
        channelDescription: 'channel description',
        playSound: true,
        priority: Priority.high,
        // importance: Importance.max,
      ),
    );
  }

// Method for show notifications
  static Future<void> showNotifications({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      await _notificationDetails(),
      payload: payload,
    );
  }

// Method for schedule notifications
  static Future<void> scheduleNotifications({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduleTime,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduleTime, tz.local),
      //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      await _notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

// Method for  daily schedule notifications
  static Future<void> scheduleDailyNotifications({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    Time scheduleTime = const Time(12, 00),
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      _dailySchedule(scheduleTime),
      await _notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static tz.TZDateTime _dailySchedule(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduleDateTime = tz.TZDateTime(tz.local, now.year, now.month,
        now.day, time.hour, time.minute, time.second);

    dynamic t = scheduleDateTime.isBefore(now)
        ? scheduleDateTime.add(const Duration(days: 1))
        : scheduleDateTime;
    return t;
  }

// Method for cancel notifications
  static Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

// Method for cancel all notifications
  static Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

/* 
For specific durtion
scheduleDate: DateTime.now().add(const Duration(seconds: 15)),

For specific time
scheduleTime: const Time(12, 30),
 */
