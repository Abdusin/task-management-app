import 'dart:math';

import 'package:flutter/material.dart';

class ScrollPainter extends CustomPainter {
  final double progress;

  /// size.height * 0.2
  final double? barHeight;
  const ScrollPainter({required this.progress, this.barHeight});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Colors.black;
    var paint2 = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Colors.white;

    var bottomRight = Offset(size.width, size.height);
    var topLeft = Offset(0, 0);

    var scrollBarHeight = barHeight ?? size.height * 0.2;
    var center = Offset(
        size.width / 2, min(max(size.height * progress, scrollBarHeight / 2), size.height - (scrollBarHeight / 2)));
    canvas.drawRect(Rect.fromPoints(topLeft, bottomRight), paint);
    canvas.drawRect(Rect.fromCenter(center: center, width: size.width, height: scrollBarHeight), paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
