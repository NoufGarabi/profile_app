// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:profile_app/screens/home_page.dart';
import 'package:profile_app/screens/share_page.dart';

void main() => runApp(MyApp());

// ==========| Reem Code |==========
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'share': (context) => SharePage(),
      },
    );
  }
}
