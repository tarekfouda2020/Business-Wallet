import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/blocs/Invist_count_cubit/invist_count_cubit.dart';
import 'package:base_flutter/customer/blocs/follow_count_cubit/follow_count_cubit.dart';
import 'package:base_flutter/customer/blocs/wallet_count_cubit/wallet_count_cubit.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalNotification {
  static StreamController<Map<String, dynamic>> _onMessageStreamController =
  StreamController.broadcast();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static late BuildContext context;
  static GlobalNotification instance = new GlobalNotification._();

  GlobalNotification._();

  GlobalNotification();

  setupNotification(BuildContext cxt)async{
    context = cxt;
    setAndroidConfiguration();
  }

  setAndroidConfiguration()async{
    _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings("@mipmap/launcher_icon");
    var ios = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android: android, iOS: ios);
    _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onSelectNotification: flutterNotificationClick,
    );

    NotificationSettings settings = await messaging.requestPermission(sound: true,badge: true,alert: true,provisional: false);
    print('User granted permission: ${settings.authorizationStatus}');
    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      messaging.getToken().then((token) {
        print(token);
      });
      await messaging.setForegroundNotificationPresentationOptions(
        alert: false, // Required to display a heads up notification
        badge: false,
        sound: false,
      );
      // messaging.getInitialMessage().then((message) => _showLocalNotification(message));
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("_____________________Message data:${message.data}");
        print("_____________________notification:${message.notification?.title}");
        _showLocalNotification(message);
        _onMessageStreamController.add(message.data);
        if (int.parse(message.data["type"]??"0") == -1) {
          Utils.clearSavedData();
          AutoRouter.of(context).push(LoginRoute());
        }
      });
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('A new onMessageOpenedApp event was published!');
        flutterNotificationClick(json.encode(message.data));
      });
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    }

  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    flutterNotificationClick(json.encode(message.data));
  }

  StreamController<Map<String, dynamic>> get notificationSubject {
    return _onMessageStreamController;
  }

  _showLocalNotification(RemoteMessage? message) async {
    if (message == null) return;

    int type = int.parse("${message.data["type"]??"0"}");
    if(type==22){
      context.read<FollowCountCubit>().onIncreaseCount();
    }else if(type==23){
      context.read<InvistCountCubit>().onIncreaseCount();
    }else if(type==24){
      context.read<WalletCountCubit>().onIncreaseCount();
    }
    if (Platform.isIOS) return;

    var android = AndroidNotificationDetails(
      "${DateTime.now()}",
      "${message.notification?.title}",
      "${message.notification?.body}",
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      shortcutId: DateTime.now().toIso8601String(),
    );
    var ios = IOSNotificationDetails();
    var _platform = NotificationDetails(android: android, iOS: ios);
    _flutterLocalNotificationsPlugin.show(
        DateTime.now().microsecond, "${message.notification?.title}", "${message.notification?.body}", _platform,
        payload: json.encode(message.data));
  }

  static Future flutterNotificationClick(String? payload) async {
    print("tttttttttt $payload");
    // var _data = json.decode("$payload");

    // int _type = int.parse(_data["type"] ?? "4");
  }

}
