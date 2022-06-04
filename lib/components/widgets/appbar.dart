import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGlassAppbar extends StatelessWidget {
  const MyGlassAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 0,right: 0,top: 8,bottom: 8),
        child: Container(
          width: 160,
          height: 68,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 16,
              spreadRadius: 2,
              color: Colors.black.withOpacity(0.12),
            )
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 40.0,
                sigmaY: 40.0,
              ),
              child: Container(
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
                          Colors.white.withOpacity(0.15),
                          Colors.white.withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1.0
                        ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'De',
                          style: GoogleFonts.poppins(
                              color: const Color(0xffF4F6F9),
                              fontWeight: FontWeight.w700,
                              fontSize: 32),
                          children: [
                            TextSpan(
                              text: 'Pay',
                              style: GoogleFonts.poppins(
                                color: const Color(0xffF4F6F9),
                                fontWeight: FontWeight.w600,
                                fontSize: 32,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
