import 'dart:ui';
import 'package:sizer/sizer.dart';
import 'package:de_pay/pages/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CoinHome extends StatelessWidget {

  String name;
  String symbol;
  String imageUrl;
  double price;
  double change;
  double changePercentage;


  CoinHome({Key? key, 
  
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.60;
    double contHeight = size.height * 0.3;
    var f = NumberFormat('###.##', 'en_US');

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Get.to(() => const YapilacakEkran());
          },
          child: SizedBox(
            width: 60.w,
            
            
            
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
                      blurRadius: 30.h,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Container(
                                height: 5.h,
                                child: ClipOval(
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                        
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                name,
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
               
                 // SizedBox(height: 1.h,),
                    // SizedBox(
                    //   width: 50.w,
                    //   height: 15.h,
                    //   child: Obx(
                    //     () => LineChart(chart(
                    //       isHomePage,
                    //       spots,
                    //       minY.value,
                    //       maxY.value,
                    //       7,
                    //       profitPercent >= 0,
                    //     )),
                    //   ),
                    // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          child: Text(
                            "\$" + price.toDouble().toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      // LineChartSample2(),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: Text(
                          changePercentage.toDouble() < 0
                              ? f
                                      .format(changePercentage.toDouble())
                                      .toString() +
                                  '%'
                              : '+' +
                                  f
                                      .format(changePercentage.toDouble())
                                      .toString() +
                                  '%',
                          style: GoogleFonts.poppins(
                            color: changePercentage.toDouble() < 0
                                ? Colors.redAccent
                                : Colors.greenAccent,
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
