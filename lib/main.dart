// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0XFF0B0C1E),
      ),
      home: const LoadingScreen(),
    );
  }
}
