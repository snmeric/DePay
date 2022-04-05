import 'package:flutter/material.dart';
import 'dart:ui' as ui;


//Background Gradient
const kGradientColor1=Color(0xffAF4F9C);
const kGradientColor2=Color(0xffE53983);
const kGradientColor3=Color(0xffFB848F);

//Card Gradient
const kCardLinearColor1=Color(0xffFCCA5B);
const kCardLinearColor2=Color(0xffFFD373);
const kCardLinearColor3=Color(0xffFBD88F);


const headline1=TextStyle(color: Color(0xff3C3C51),fontSize: 32);
const headline2=TextStyle(color: Colors.black,fontSize: 16);
const headline3=TextStyle(color: Colors.black,fontSize: 14);

//Card Text
const cardtext1=TextStyle(color: Colors.white,fontSize: 16);
const cardtext2=TextStyle(color: Colors.white38,fontSize: 14);


//Background svg
const svgIcon1='lib/components/images/background/ellipse1.svg';


//HomeScreen 
const tanitim1='lib/components/images/1.webp';
const tanitim2='lib/components/images/2.png';
const tanitim3='lib/components/images/3.png';
const tanitim4='lib/components/images/4.png';


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