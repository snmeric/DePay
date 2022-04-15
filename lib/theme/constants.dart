import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:google_fonts/google_fonts.dart';

//Background
const kBackgroundColor = Color(0xff2C2E3B);
const kColorText = Color(0xffF4F6F9);

//Card Gradient
const kGradient1Color1 = Color(0xff7717B3);
const kGradient1Color2 = Color(0xffDF09CA);
const kGradient2Color1 = Color(0xff17B3A9);
const kGradient2Color2 = Color(0xff0945DF);

//Card Text
const cardtext1 = TextStyle(color: Colors.white, fontSize: 16);
const cardtext2 = TextStyle(color: Colors.white38, fontSize: 14);

//Background svg
const svgIcon1 = 'lib/components/images/background/ellipse1.svg';

//HomeScreen
const tanitim1 = 'lib/components/images/1.webp';
const tanitim2 = 'lib/components/images/2.png';
const tanitim3 = 'lib/components/images/3.png';
const tanitim4 = 'lib/components/images/4.png';

//SHAPE 1
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 15);
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.6662907, size.height * 0.2225141),
        Offset(size.width * 0.4009173, size.height * 0.6283876), [
      Color(0xffAF4F9C).withOpacity(1),
      Color(0xffE53983).withOpacity(1),
      Color(0xffFB848F).withOpacity(1)
    ], [
      0,
      0.479271,
      1
    ]);
    canvas.drawCircle(Offset(size.width * 0.4586667, size.height * 0.5000000),
        size.width * 0.2640000, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//SHAPE 2
class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill;
      //..maskFilter = MaskFilter.blur(BlurStyle.normal, 15);
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.6662907, size.height * 0.2225141),
        Offset(size.width * 0.4009173, size.height * 0.6283876), [
      Color(0xff72047B).withOpacity(1),
      Color(0xff6709DF).withOpacity(1)
    ], [
      0,
      1
    ]);
    canvas.drawCircle(Offset(size.width * 0.4586667, size.height * 0.5000000),
        size.width * 0.2640000, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//SHAPE 3
class RPSCustomPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill;
      //..maskFilter = MaskFilter.blur(BlurStyle.normal, 15);
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.6662907, size.height * 0.2225141),
        Offset(size.width * 0.4009173, size.height * 0.6283876), [
      Color(0xff17B3A9).withOpacity(1),
      Color(0xff0945DF).withOpacity(1)
    ], [
      0,
      1
    ]);
    canvas.drawCircle(Offset(size.width * 0.4586667, size.height * 0.5000000),
        size.width * 0.2640000, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


//SHAPE 4
class RPSCustomPainter4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill;
      //..maskFilter = MaskFilter.blur(BlurStyle.normal, 15);
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.6662907, size.height * 0.2225141),
        Offset(size.width * 0.4009173, size.height * 0.6283876), [
      Color(0xff8FE74A).withOpacity(1),
      Color(0xff44E6B5).withOpacity(1)
    ], [
      0,
      1
    ]);
    canvas.drawCircle(Offset(size.width * 0.4586667, size.height * 0.5000000),
        size.width * 0.2640000, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//SHAPE 5
class RPSCustomPainter5 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill;
      //..maskFilter = MaskFilter.blur(BlurStyle.normal, 15);
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.6662907, size.height * 0.2225141),
        Offset(size.width * 0.4009173, size.height * 0.6283876), [
      Color(0xff7717B3).withOpacity(1),
      Color(0xffDF09CA).withOpacity(1)
    ], [
      0,
      1
    ]);
    canvas.drawCircle(Offset(size.width * 0.4586667, size.height * 0.5000000),
        size.width * 0.2640000, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}