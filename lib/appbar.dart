import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          AppBar(
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            toolbarHeight: 60,
            elevation: 0.0,
            centerTitle: true,
            title: RichText(
              text: TextSpan(
                  text: 'De',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff3C3C51),
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                  children: [
                    TextSpan(
                      text: 'Pay',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff3C3C51),
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                      ),
                    ),
                  ]),
            ),
          ),
        ], body: ListView(),
     
      
    );
  }
}
