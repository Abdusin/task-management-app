import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/models/TaskModel.dart';
import 'package:task_management_app/utils/AppSpaces.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(right: 5, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Row(
          children: [
            Image.asset(
              task.image,
              height: 60,
            ),
            AppSpaces.horizontal20,
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  task.title,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                AppSpaces.vertical5,
                Text(
                  task.description,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            color: Get.theme.canvasColor,
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            task.time,
            style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      )
    ]);
  }
}
