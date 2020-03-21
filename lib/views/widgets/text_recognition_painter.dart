import 'dart:ui';

import 'package:flutter/material.dart';

class RecognizedTextPaint extends CustomPaint {
  final CustomPainter painter;

  RecognizedTextPaint({this.painter}) : super(painter: painter);
}

class TextRecognitionPainter extends CustomPainter {
  Rect box;
  List<Offset> cornerPoints;

  TextRecognitionPainter({this.box, this.cornerPoints});

  @override
  void paint(Canvas canvas, Size size) {
//    for (var i = 0; i < cornerPoints.length; i++) {
//      final textPaint = Paint()
//        ..strokeWidth = 3.0
//        ..color = Colors.red;
    print('rect = $box');
    print('offsets = $cornerPoints');
    canvas.drawRect(
        box,
        Paint()
          ..strokeWidth = 100.0
          ..color = Colors.red);

//    canvas.drawPoints(
//        PointMode.polygon,
//        cornerPoints,
//        Paint()
//          ..strokeWidth = 3.0
//          ..color = Colors.red);
//    }
  }

  @override
  bool shouldRepaint(TextRecognitionPainter oldDelegate) {
    return box != oldDelegate.box || cornerPoints != oldDelegate.cornerPoints;
  }
}
