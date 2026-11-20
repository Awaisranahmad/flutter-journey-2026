import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb; // 👈 Upar imports mein yeh add karein

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // ---------- INITIALIZE ----------
  Future<void> initialize() async {
    // 1. Request Permission
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    }

    // 2. Local Notifications sirf Mobile (Android/iOS) par initialize karein, Web par nahi
    if (!kIsWeb) {
      const AndroidInitializationSettings androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const InitializationSettings initSettings = InitializationSettings(
        android: androidSettings,
      );

      await _localNotifications.initialize(settings: initSettings);
    }

    // 3. Listen to Foreground Notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Foreground message: ${message.notification?.title}');
      if (message.notification != null && !kIsWeb) {
        _showLocalNotification(message);
      }
    });
  }

  // ---------- GET TOKEN ----------
  Future<String?> getToken() async {
    try {
      if (kIsWeb) {
        // Chrome (Web) par onRegistered stream fire nahi hoti, isliye Web par getToken hi chalta hai
        // ignore: deprecated_member_use
        return await _fcm.getToken(vapidKey: '');
      } else {
        // Android / iOS ke liye naya API
        final tokenFuture = _fcm.onRegistered.first.timeout(
          const Duration(seconds: 10),
        );
        await _fcm.register();
        return await tokenFuture;
      }
    } catch (e) {
      debugPrint('FCM Token Error: $e');
      return 'Error: $e';
    }
  }

  // ---------- SHOW LOCAL NOTIFICATION ----------
  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'default_channel',
          'Default Channel',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotifications.show(
      id: message.hashCode,
      title: message.notification?.title ?? 'New Message',
      body: message.notification?.body ?? 'You have a new notification',
      notificationDetails: platformDetails,
    );
  }
}
