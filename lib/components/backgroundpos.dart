import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcons extends StatelessWidget {
  final String svgName;
  final int degree;
  final double top;
  final double left;
  final double width;
  final double height;

  const SvgIcons(
      {Key? key,
      required this.svgName,
      required this.degree,
      required this.top,
      required this.left,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(degree / 360),
        child: SvgPicture.asset(
          svgName,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
