import 'package:flutter/material.dart';

class CircleGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.2, size.height / 2);
    final radii = [120.0, 80.0, 40.0];
    final colors = [
      Colors.green[100]!,
      Colors.green[200]!,
      Colors.green[300]!,
    ];

    for (int i = 0; i < radii.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;
      canvas.drawCircle(center, radii[i], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}