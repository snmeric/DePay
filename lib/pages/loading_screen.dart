import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class YapilacakEkran extends StatelessWidget {
  const YapilacakEkran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff2C2E3B),
      appBar: AppBar(
        title: Text(
          "YAPIM AŞAMASINDA",
          style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        child: RiveAnimation.asset(
          "lib/components/animations/finger-tapping.riv",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
