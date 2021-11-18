import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/controllers/AddScreenController.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddScreenController>(
      init: AddScreenController(),
      builder: (controller) => Scaffold(body: Container()),
    );
  }
}
