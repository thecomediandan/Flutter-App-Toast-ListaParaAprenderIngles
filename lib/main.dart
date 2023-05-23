import 'package:flutter/material.dart';
import 'package:flutter_app_list_english/screens/home_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List English',
      theme: ThemeData(brightness: Brightness.dark),
      home: const MyHome(),
    );
  }
}
