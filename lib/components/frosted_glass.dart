import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  final double width, height;
  final Widget child;

  const FrostedGlass(
      {Key? key,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        alignment: Alignment.centerRight,
        width: width,
        height: height,
        child: Stack(children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 7.0,
              sigmaY: 7.0,
            ),
            child: Container(
              width: width,
              height: height,
              child: Text(" "),
            ),
          ),
          Opacity(
              opacity: 0.04,
              child: Image.asset(
                "lib/components/images/noise.jpg",
                width: MediaQuery.of(context).size.width * width,
                height: MediaQuery.of(context).size.height * height,
                fit: BoxFit.cover,
              )),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 30,
                    spreadRadius: 2,
                  )
                ],
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: Colors.white.withOpacity(0.1), width: 1.5),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.08),
                      Colors.white.withOpacity(0.05),
                    ],
                    stops: const [
                      0.1,
                      1.0
                    ])),
          )
        ]),
      ),
    );
  }
}
