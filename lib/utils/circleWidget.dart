import 'dart:math';
import 'package:flutter/material.dart';

class CircularPercentageWidget extends StatelessWidget {
  final double percentage;
  final List<Color> colors;
  final String text;

  CircularPercentageWidget(
      {required this.percentage, required this.colors, required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(150, 150), // Adjust the size as needed
      painter: CircularPercentagePainter(
        percentage: percentage,
        colors: colors,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CircularPercentagePainter extends CustomPainter {
  final double percentage;
  final List<Color> colors;

  CircularPercentagePainter({required this.percentage, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    double angle = 2 * pi * (percentage / 100);
    double radius = size.width / 2;

    // Define a rectangle that represents the circle
    Rect rect = Rect.fromCircle(center: Offset(radius, radius), radius: radius);

    // Create a Paint object for the background circle
    Paint backgroundPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    // Create a Paint object for the colored arc
    Paint arcPaint = Paint()
      ..shader = SweepGradient(
        startAngle: 0.0,
        endAngle: angle,
        colors: colors,
      ).createShader(rect)
      ..style = PaintingStyle.fill;

    // Draw the background circle
    canvas.drawCircle(Offset(radius, radius), radius, backgroundPaint);

    // Draw the colored arc
    canvas.drawArc(rect, -pi / 2, angle, true, arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
