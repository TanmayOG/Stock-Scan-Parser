import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double strokeWidth;
  final double gap;

  DottedDivider({
    this.height = 1.0,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.gap = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromHeight(height),
      painter:
          _DottedLinePainter(color: color, strokeWidth: strokeWidth, gap: gap),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  _DottedLinePainter(
      {required this.color, required this.strokeWidth, required this.gap});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double y = size.height / 2;
    double startX = 0;
    double endX = size.width;

    while (startX < endX) {
      canvas.drawLine(Offset(startX, y), Offset(startX + gap, y), paint);
      startX +=
          2 * gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
