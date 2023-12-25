import 'package:flutter/material.dart';
import 'package:travel_project/home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "Travel Agency",

      home: Home(),

    );
  }
}
