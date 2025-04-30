import 'dart:developer';

import 'package:chatapp/MVVM/View/FlutterKeys/keys_screen.dart';
import 'package:chatapp/MVVM/View/Notification/local_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await LocalNotificationService.initialize();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final title = message.notification?.title ?? 'No Title';
    final body = message.notification?.body ?? 'No Body';

    LocalNotificationService.showNotification(title, body);
  });
  await getToken();
  runApp(const MyApp());
}

Future<void> getToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  log("FCM Token: $token");
}

void showCustomNotification(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        const Icon(Icons.notifications, color: Colors.white),
        const SizedBox(width: 10),
        Expanded(child: Text(message)),
      ],
    ),
    backgroundColor: Colors.blueAccent,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const KeysScreen(),
    );
  }
}
