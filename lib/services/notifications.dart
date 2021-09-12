import 'package:birthday_app/common/utils.dart';
import 'package:birthday_app/models/birthday.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

const _channelID = "birthdayAppChannel";
const _channelName = "BirthdayApp";
const _channelDescription = "Notifications pour l'application Birthday App";

class Notifications {
  static late FlutterLocalNotificationsPlugin notifications;

  static void initNotifications() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Paris'));

    notifications = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('app_icon');

    final InitializationSettings settings =
        InitializationSettings(android: androidSettings);

    await notifications.initialize(settings);

    var notificationsChannel = AndroidNotificationChannel(
        _channelID, _channelName, _channelDescription);

    await notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(notificationsChannel);
  }

  static void scheduleBirthdayNotification(Birthday birthday) async {
    await notifications.zonedSchedule(
        0,
        'Rappel Anniversaire de ${birthday.person}',
        "C'est bientôt l'anniversaire de ${birthday.person} ! Ce sera ses ${Utils.nextAge(birthday.date)} ans ! Penses à lui souhaiter ;)",
        tz.TZDateTime.from(Utils.nextBirthdayDate(birthday.date), tz.local),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                _channelID, _channelName, _channelDescription)),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static void displayPendingNotifications() async {
    print("ok");
    final List<PendingNotificationRequest> requests =
        await notifications.pendingNotificationRequests();
    requests.forEach((request) {
      print("${request.title} : ${request.body}");
    });
  }
}
