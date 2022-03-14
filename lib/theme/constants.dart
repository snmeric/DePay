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

    Path path_0 = Path();
    path_0.moveTo(size.width*0.2450000,size.height*-0.3340000);
    path_0.cubicTo(size.width*0.3220000,size.height*-0.2820000,size.width*0.3920000,size.height*-0.2160000,size.width*0.4140000,size.height*-0.1380000);
    path_0.cubicTo(size.width*0.4350000,size.height*-0.05900000,size.width*0.4070000,size.height*0.03200000,size.width*0.3730000,size.height*0.1170000);
    path_0.cubicTo(size.width*0.3400000,size.height*0.2010000,size.width*0.3000000,size.height*0.2790000,size.width*0.2360000,size.height*0.3320000);
    path_0.cubicTo(size.width*0.1730000,size.height*0.3850000,size.width*0.08700000,size.height*0.4130000,size.width*0.005000000,size.height*0.4050000);
    path_0.cubicTo(size.width*-0.07600000,size.height*0.3980000,size.width*-0.1520000,size.height*0.3560000,size.width*-0.2120000,size.height*0.3020000);
    path_0.cubicTo(size.width*-0.2720000,size.height*0.2480000,size.width*-0.3150000,size.height*0.1820000,size.width*-0.3410000,size.height*0.1090000);
    path_0.cubicTo(size.width*-0.3660000,size.height*0.03600000,size.width*-0.3740000,size.height*-0.04400000,size.width*-0.3540000,size.height*-0.1170000);
    path_0.cubicTo(size.width*-0.3330000,size.height*-0.1900000,size.width*-0.2840000,size.height*-0.2570000,size.width*-0.2200000,size.height*-0.3140000);
    path_0.cubicTo(size.width*-0.1560000,size.height*-0.3710000,size.width*-0.07800000,size.height*-0.4180000,size.width*0.003000000,size.height*-0.4230000);
    path_0.cubicTo(size.width*0.08400000,size.height*-0.4270000,size.width*0.1680000,size.height*-0.3870000,size.width*0.2450000,size.height*-0.3340000);
    path_0.close();



    Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(Offset(0,size.height*0.01000000), Offset(size.width*0.01000000,0), [kGradientColor1.withOpacity(1)], [0]);
    canvas.drawPath(path_0,paint0Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}