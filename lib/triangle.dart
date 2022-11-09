import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color backgroundColor;

  TrianglePainter(this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
    ..color = backgroundColor;

    var x = size.width;
    var y = size.height;

    canvas.drawPath(
        Path()
          ..moveTo(0, y)
          ..lineTo(x / 2, 0)
          ..lineTo(x, y)
          ..lineTo(0, y),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // TODO implement
  }
}
