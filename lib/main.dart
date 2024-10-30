import 'package:perpustakaan/views/favorite_view.dart';
import 'package:perpustakaan/views/home_view.dart';
import 'package:perpustakaan/views/landing_view.dart';
import 'package:perpustakaan/views/notification_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root widget of the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/land',
        routes: {
          '/land': (_) => LandingView(),
          '/': (_) => HomePageBook(),
          '/f': (_) => FavoritePage(),
          '/n': (_) => NotificationView(),
        });
  }
}
