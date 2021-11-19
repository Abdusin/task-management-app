import 'package:get/get.dart';

class AddScreenController extends GetxController {
  var categoryList = [
    'Development',
    'Researh',
    'Design',
    'Backend',
    'Business',
    'Marketing',
    'Finance',
  ];

  var selectedIndex = 0;
  void setIndex(int index) {
    selectedIndex = index;
    update();
  }
}
