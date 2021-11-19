import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/controllers/AddScreenController.dart';
import 'package:task_management_app/utils/AppAssets.dart';
import 'package:task_management_app/utils/AppSpaces.dart';
import 'package:task_management_app/widgets/FormElements.dart';
import 'package:task_management_app/widgets/buttons.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddScreenController>(
      init: AddScreenController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          AppSpaces.vertical30,
          Row(children: [
            AppSpaces.horizontal10,
            IconButton(onPressed: Get.back, icon: ImageIcon(AssetImage(AppAssets.arrow))),
            Spacer(),
            IconButton(onPressed: Get.back, icon: ImageIcon(AssetImage(AppAssets.menu))),
            AppSpaces.horizontal20,
          ]),
          AppSpaces.vertical10,
          Row(children: [
            AppSpaces.horizontal30,
            Text(
              'Create New Task',
              style: TextStyle(
                color: Colors.black,
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            Image.asset(
              AppAssets.note,
              height: 40,
            ),
            AppSpaces.horizontal30,
          ]),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              AppSpaces.vertical25,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: AppTextField(
                  label: 'Task Name',
                  value: 'Team Meeting',
                ),
              ),
              AppSpaces.vertical25,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Text(
                      'Select Category',
                      style: TextStyle(
                        fontSize: 16,
                        color: Get.theme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 13,
                        color: Get.theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpaces.vertical25,
              Container(
                height: 32,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categoryList.length,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  separatorBuilder: (context, index) => AppSpaces.horizontal15,
                  itemBuilder: (context, index) => CategoryButton(
                    label: controller.categoryList[index],
                    isSelected: controller.selectedIndex == index,
                    onTap: () => controller.setIndex(index),
                  ),
                ),
              ),
              AppSpaces.vertical25,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(children: [
                  Expanded(
                    flex: 20,
                    child: AppTextField(
                      label: 'Date',
                      value: 'Monday, 1 June',
                    ),
                  ),
                  Spacer(flex: 10),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Get.theme.primaryColor,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
              AppSpaces.vertical25,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(children: [
                  Expanded(
                    child: AppTextField(
                      label: 'Start Time',
                      value: '10:00 AM',
                      suffix: Image.asset(
                        AppAssets.arrow_down,
                        width: 25,
                      ),
                    ),
                  ),
                  AppSpaces.horizontal20,
                  Expanded(
                    child: AppTextField(
                      label: 'End Time',
                      value: '11:00 AM',
                      suffix: Image.asset(
                        AppAssets.arrow_down,
                        width: 25,
                      ),
                    ),
                  ),
                ]),
              ),
              AppSpaces.vertical25,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: AppTextField(
                  label: 'Describtion',
                  value: 'Discuss all question about project',
                ),
              ),
              AppSpaces.vertical25,
              Center(
                child: AppButton(
                  label: 'Create Task',
                  onTap: () => Get.snackbar('Success', 'Task Created Successfully'),
                ),
              ),
              AppSpaces.vertical25,
            ],
          )),
        ]),
      ),
    );
  }
}
