import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task_management_app/controllers/HomeScreenController.dart';
import 'package:task_management_app/models/TaskModel.dart';
import 'package:task_management_app/screens/AddScreen.dart';
import 'package:task_management_app/utils/AppAssets.dart';
import 'package:task_management_app/utils/AppSpaces.dart';
import 'package:task_management_app/widgets/TaskCard.dart';
import 'package:task_management_app/widgets/Scrollbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Get.theme.primaryColor,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          AppSpaces.vertical20,
                          AppSpaces.vertical30,
                          Row(children: [
                            AppSpaces.horizontal30,
                            Image.asset(
                              AppAssets.menu,
                              width: 30,
                            ),
                            AppSpaces.horizontal20,
                            Image.asset(
                              AppAssets.notification,
                              width: 30,
                            ),
                          ]),
                          AppSpaces.vertical25,
                          Row(children: [
                            AppSpaces.horizontal30,
                            Text(
                              'My Task',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () => Get.to(() => AddScreen()),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Get.theme.primaryColor,
                                ),
                                width: 50,
                                height: 50,
                                child: Center(
                                    child: Image.asset(
                                  AppAssets.plus,
                                  width: 20,
                                  height: 20,
                                )),
                              ),
                            ),
                            AppSpaces.horizontal30,
                          ]),
                          AppSpaces.vertical15,
                          Row(children: [
                            AppSpaces.horizontal30,
                            Text(
                              'Today',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Monday, 1 June',
                              style: TextStyle(
                                color: Get.theme.colorScheme.secondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            AppSpaces.horizontal30,
                          ]),
                          AppSpaces.vertical15,
                          Container(
                            height: 60,
                            padding: EdgeInsets.only(left: 30),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: DayButton(
                                    dayNumber: index + 1,
                                    character: controller.getWeekOfDaysFirstLettersByIndex(index),
                                    isSelected: controller.selectedIndex == index,
                                    onTap: () {
                                      controller.setSelectedIndex(index);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          AppSpaces.vertical20,
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
                        ),
                        padding: EdgeInsets.only(top: 30),
                        child: Row(children: [
                          AppSpaces.horizontal30,
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Obx(
                              () => CustomPaint(
                                willChange: true,
                                painter: ScrollPainter(
                                  progress: controller.progress.value,
                                  barHeight: 30,
                                ),
                                child: Container(
                                    width: 2,
                                    height: Get.height,
                                    child: SizedBox(
                                      height: controller.progress.value,
                                    )),
                              ),
                            ),
                          ),
                          AppSpaces.horizontal30,
                          Expanded(
                            child: ListView.separated(
                              controller: controller.scrollController,
                              itemCount: taskList.length,
                              padding: EdgeInsets.only(bottom: 30),
                              separatorBuilder: (context, index) => AppSpaces.vertical30,
                              itemBuilder: (context, index) {
                                return TaskCard(task: taskList[index]);
                              },
                            ),
                          ),
                          AppSpaces.horizontal25,
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.corner),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 115,
                  width: 135,
                  child: Align(
                    alignment: Alignment(0.4, -0.4),
                    child: Icon(Icons.account_circle, color: Colors.white, size: 40),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DayButton extends StatelessWidget {
  const DayButton({
    Key? key,
    required this.dayNumber,
    required this.character,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final int dayNumber;
  final String character;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? Get.theme.primaryColor : Colors.white,
            border: Border.all(color: isSelected ? Get.theme.primaryColor : Get.theme.colorScheme.secondary)),
        child: Column(children: [
          Spacer(flex: 10),
          Text(
            '$fixedDayNumber',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          Spacer(flex: 10),
          Text(
            '$character',
            style: TextStyle(
              color: isSelected ? Colors.white : Get.theme.colorScheme.secondary,
            ),
          ),
          Spacer(flex: 5),
        ]),
      ),
    );
  }

  String get fixedDayNumber => dayNumber < 10 ? '0$dayNumber' : '$dayNumber';
}
