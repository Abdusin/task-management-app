import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected ? Get.theme.primaryColor : Colors.white,
              border:
                  Border.all(width: 2, color: isSelected ? Get.theme.primaryColor : Get.theme.colorScheme.secondary)),
          child: Center(
            child: Text(
              '$label',
              style: TextStyle(
                color: isSelected ? Colors.white : Get.theme.colorScheme.secondary,
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
    );
  }
}

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AppButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: Get.theme.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
