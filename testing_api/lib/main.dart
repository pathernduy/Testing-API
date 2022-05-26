import 'package:flutter/material.dart';
import 'package:testing_api/Views/homepage.dart';
import 'package:testing_api/services/connectAPI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API',
      home: HomePage(),
    );
  }
}
