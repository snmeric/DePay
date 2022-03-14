import 'package:de_pay/theme/constants.dart';
import 'package:flutter/material.dart';

import '../components/backgroundpos.dart';


class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        SvgIcons(
          svgName: svgIcon1,
          degree: 20,
          top: 100,
          left: 50,
          width: 200,
          height: 200,
        ),

      ],
    );
  }
}



/*
class BackgroundImageFb1 extends StatelessWidget {
  final Widget child;
  final String imageUrl;
  const BackgroundImageFb1(
      {required this.child, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Place as the child widget of a scaffold
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}*/