import 'package:app_bartask/filter.dart/filtericon.dart';
import 'package:app_bartask/menubar.dart/menubar.dart';
import 'package:app_bartask/search/searchfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue.shade300,
      //   actions: [
      //     FilterScreen(),
      //     MenuScreen(),
      //   ],
      // ),
      body: SelectionScreen(),
    );
  }
}
