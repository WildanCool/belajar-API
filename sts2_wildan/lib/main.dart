import 'package:flutter/material.dart';
import 'package:sts2_wildan/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STS2 25/26 Wildan',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
