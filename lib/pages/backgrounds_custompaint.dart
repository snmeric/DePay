import 'package:flutter/material.dart';

import '../theme/constants.dart';

class BackgroundsCustomPaint extends StatelessWidget {
  final double left;

  final double top;

  final double size;


  const BackgroundsCustomPaint({
    Key? key,
    required this.left,

    required this.top,

    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: CustomPaint(
        size: Size(
            size,
            (size * 1.328)
                .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: RPSCustomPainter(),
      ),
    );
  }
}
