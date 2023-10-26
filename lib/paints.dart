import 'package:flutter/material.dart';

class PageViewIndicatorEllipse extends CustomPainter {
  PageViewIndicatorEllipse({
    required this.length,
    required this.activeIndex,
    required this.activeColor,
    required this.inactiveColor,
  });
  final int length;
  final int activeIndex;
  final Color activeColor;
  final Color inactiveColor;

  @override
  void paint(Canvas canvas, Size size) {
    const double spacing = 10.0;
    const double dimension = 10.0;
    final double dy = size.height - 15.0;
    final double width = dimension * length + spacing * (length - 1);
    final double startPoint = size.width/2 - width/2;

    for (int i = 0; i < length; i++) {
      final Paint paint = Paint();
      final Path path = Path();
      final double dx = i * (dimension + spacing) + startPoint;
      final Offset center = Offset(dx, dy);
      final Rect rect = Rect.fromCenter(center: center, width: dimension, height: dimension);
      paint.color = i == activeIndex ? activeColor : inactiveColor;
      path.addOval(rect);
      canvas.drawPath(path, paint);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
