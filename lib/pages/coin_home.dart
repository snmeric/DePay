import 'dart:ui';

import 'package:de_pay/pages/graphic.dart';
import 'package:de_pay/pages/loading_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism/glassmorphism.dart';

class CoinHome extends StatelessWidget {
  final String coinAdi;
  final double fiyati;
  final double degisim;
  final bool artmisMi;

  const CoinHome(
      {Key? key,
      required this.coinAdi,
      required this.fiyati,
      required this.degisim,
      required this.artmisMi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.60;
    double contHeight = size.height * 0.3;
    artmisMi == true;


    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const YapilacakEkran()),
            );
          },
          child: SizedBox(
            width: contWidth,
            height: contHeight,
            child: Stack(children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15.0,
                  sigmaY: 15.0,
                ),
                child: Opacity(
                  opacity: 0.07,
                  child: Image.asset(
                    "lib/components/images/noise.jpg",
                    width: MediaQuery.of(context).size.width * contWidth,
                    height: MediaQuery.of(context).size.height * contHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 30,
                      spreadRadius: 2,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 1.8),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.10),
                      Colors.white.withOpacity(0.25),
                    ],
                    stops: const [0.1, 1.0],
                  ),
                ),
              ),

              //GRAFİK
           


              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                coinAdi,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: Text(
                          "\$" + fiyati.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      // LineChartSample2(),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: Text(
                          "%" + degisim.toString(),
                          style: GoogleFonts.poppins(
                            color: artmisMi ? Colors.green : Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
      
    );
    
  }

  
}


 