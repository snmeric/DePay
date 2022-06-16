import 'package:de_pay/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:ui';
import 'package:sizer/sizer.dart';
import 'package:de_pay/pages/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePart extends StatelessWidget {
 

  HomePart({
    Key? key,
   
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
            height: 13.h,
            width: 80.w,
            child: Stack(children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15.0,
                  sigmaY: 15.0,
                ),
                child: Opacity(
                  opacity: 0.07,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                      Column(
                          children: [
                              SizedBox(height: 6.h, child: 
                            Image.asset('lib/components/icons/Discount.png',fit:BoxFit.cover,),),
                            Text('İşlemler',style: minTextStyle,)
                          ],
                        ),
                        Column(
                          children: [
                              SizedBox(height: 6.h, child: 
                            Image.asset('lib/components/icons/Document.png',fit:BoxFit.cover,),),
                            Text("NFT'lerim",style: minTextStyle,)
                          ],
                        ),
                        Column(
                          children: [
                              SizedBox(height: 6.h, child: 
                            Image.asset('lib/components/icons/Activity.png',fit:BoxFit.cover,),),
                            Text('Coinlerim',style: minTextStyle,)
                          ],
                        ),
                       
                       
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
