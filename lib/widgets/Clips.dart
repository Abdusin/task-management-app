import 'package:flutter/material.dart';

class HomeScreenClip extends CustomClipper<Path> {
  /// Play with scals to get more clear versions
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var percent = 0.68;
    var percent2 = 0.68;
    var value = 25;
    var controlPoint1End = Offset((size.width + (value / 2)) * percent, height * percent);
    var controlPoint1Angle = Offset(size.width, height);
    var controlPoint1Angle2 = Offset(size.width, height * percent2);

    var leftBottomControl = Offset(width * (1 - percent), height * percent);
    var leftBottomEnd = Offset(width * (1 - percent), (height * percent) - value);

    var controlPoint2End = Offset(0.0, 0.0);
    var controlPoint2Angle = Offset(width * (1 - percent), 0);
    var controlPoint2Angle2 = Offset(width * (1 - percent2), 0);
    final path = Path();
    path.moveTo(width, 0);
    path.lineTo(width, height);
    path.cubicTo(controlPoint1Angle.dx, controlPoint1Angle.dy, controlPoint1Angle2.dx, controlPoint1Angle2.dy,
        controlPoint1End.dx, controlPoint1End.dy);
    path.lineTo(leftBottomControl.dx + value, leftBottomControl.dy);
    path.quadraticBezierTo(leftBottomControl.dx, leftBottomControl.dy, leftBottomEnd.dx, leftBottomEnd.dy);
    // path.lineTo(controlPoint2.dx, controlPoint2.dy + value);
    path.cubicTo(controlPoint2Angle.dx, controlPoint2Angle.dy, controlPoint2Angle2.dx, controlPoint2Angle2.dy,
        controlPoint2End.dx, controlPoint2End.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
