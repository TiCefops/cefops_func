import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class CardPath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(0,0,size.width,size.height),bottomRight: Radius.circular(size.width*0.04504505),bottomLeft:  Radius.circular(size.width*0.04504505),topLeft:  Radius.circular(size.width*0.04504505),topRight:  Radius.circular(size.width*0.04504505)),paint_0_fill);

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xff002573).withOpacity(1.0);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(size.width*0.1441441,size.height*0.5285235,size.width*0.7252252,size.height*0.07550336),bottomRight: Radius.circular(size.width*0.02252252),bottomLeft:  Radius.circular(size.width*0.02252252),topLeft:  Radius.circular(size.width*0.02252252),topRight:  Radius.circular(size.width*0.02252252)),paint_1_fill);

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = Color(0xff002573).withOpacity(1.0);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(size.width*0.1441441,size.height*0.6812081,size.width*0.7252252,size.height*0.07550336),bottomRight: Radius.circular(size.width*0.02252252),bottomLeft:  Radius.circular(size.width*0.02252252),topLeft:  Radius.circular(size.width*0.02252252),topRight:  Radius.circular(size.width*0.02252252)),paint_2_fill);

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = Color(0xff002573).withOpacity(1.0);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(size.width*0.1441441,size.height*0.8338926,size.width*0.7252252,size.height*0.07550336),bottomRight: Radius.circular(size.width*0.02252252),bottomLeft:  Radius.circular(size.width*0.02252252),topLeft:  Radius.circular(size.width*0.02252252),topRight:  Radius.circular(size.width*0.02252252)),paint_3_fill);

    Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
    paint_4_fill.color = Color(0xff002573).withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.05180180,0,size.width*0.04954955,size.height*0.4328859),paint_4_fill);

    Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
    paint_5_fill.color = Color(0xffFF7100).withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.1193694,0,size.width*0.04954955,size.height*0.3691275),paint_5_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}