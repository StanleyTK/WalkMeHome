import 'package:flutter/material.dart';
import 'package:walkmehome/pages/login.dart';
import 'package:walkmehome/pages/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WalkMeHome',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Comment Login Page and uncomment navbar page
      home: LoginPage(),
      // home: const MyNavBarPage()
    );
  }
}
