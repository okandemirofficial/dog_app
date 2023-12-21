//Add this CustomPaint widget to the Widget Tree
import 'package:flutter/widgets.dart';

//Copy this CustomPainter code to the Bottom of the File
class BottomAppBarCustomPainter extends CustomPainter {
  BottomAppBarCustomPainter({
    required this.color,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(size.width * 0.03682320, size.height * 0.1369582)
      ..cubicTo(
        size.width * 0.04019253,
        size.height * 0.05798857,
        size.width * 0.05802160,
        0,
        size.width * 0.07893227,
        0,
      )
      ..lineTo(size.width * 0.9210667, 0)
      ..cubicTo(
        size.width * 0.9419787,
        0,
        size.width * 0.9598080,
        size.height * 0.05798867,
        size.width * 0.9631760,
        size.height * 0.1369582,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.03682320, size.height * 0.1369582)
      ..close();

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
