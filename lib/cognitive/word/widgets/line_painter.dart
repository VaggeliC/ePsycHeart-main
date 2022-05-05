import 'package:epsycheart/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final Offset? start;
  final Offset? end;
  final double strokeWidth;
  final Color lineColor;

  LinePainter(
      {this.start,
      this.end,
      this.strokeWidth = 10,
      this.lineColor = AppTheme.blue})
      : super();

  @override
  void paint(Canvas canvas, Size size) {
    if (start == null || end == null) {
      return;
    }

    canvas.drawLine(
        start!,
        end!,
        Paint()
          ..strokeCap = StrokeCap.round
          ..strokeWidth = strokeWidth
          ..color = lineColor);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate.start != start || oldDelegate.end != end;
  }
}
