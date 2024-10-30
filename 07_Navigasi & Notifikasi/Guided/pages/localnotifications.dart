import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Colors.amber,
      )),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // Set ikon notifikasi
    var initializationSettingsIOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String? payload) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return NewScreen(
        payload: payload ?? '',
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Flutter Notification Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                minimumSize: Size(250, 50),
              ),
              onPressed: showNotification,
              child: Text('Show Notification'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showNotification() async {
    var androidDetails = AndroidNotificationDetails(
      'id',
      'channel',
      'description',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSDetails = IOSNotificationDetails();
    var platformDetails =
        NotificationDetails(android: androidDetails, iOS: iOSDetails);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Flutter Devs',
      'Flutter Local Notification Demo',
      platformDetails,
      payload: 'Welcome to the Local Notification demo',
    );
  }
}

class NewScreen extends StatelessWidget {
  final String payload;

  NewScreen({required this.payload});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(payload),
      ),
      body: Center(child: Text(payload)),
    );
  }
}
