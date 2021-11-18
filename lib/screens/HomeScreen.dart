import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/controllers/HomeScreenController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => Scaffold(body: Container()),
    );
  }
}
