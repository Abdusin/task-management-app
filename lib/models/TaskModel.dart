import 'package:task_management_app/utils/AppAssets.dart';

class TaskModel {
  final String title;
  final String description;
  final String time;
  final String image;

  const TaskModel({
    required this.title,
    required this.description,
    required this.time,
    required this.image,
  });
}

var taskList = const <TaskModel>[
  TaskModel(
    title: 'Team Meeting',
    description: 'Discuss all question about project',
    time: '10:00 AM',
    image: AppAssets.team,
  ),
  TaskModel(
    title: 'Call the stylist',
    description: 'Agree on evening look',
    time: '11:00 AM',
    image: AppAssets.phone,
  ),
  TaskModel(
    title: 'Check mails',
    description: 'Write to manager',
    time: '01:00 PM',
    image: AppAssets.mail,
  ),
];
