import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Color(0xff429AE0),
          colorScheme: ColorScheme.light(
            secondary: Color(0xff99C8F0),
          ),
          canvasColor: Color(0xff232323),
          fontFamily: 'local-inter'),
      home: HomeScreen(),
    );
  }
}
