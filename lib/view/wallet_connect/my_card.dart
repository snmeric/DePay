import 'dart:ui';
import 'package:get/get.dart';
import 'package:de_pay/pages/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.70;
    double contHeight = size.height * 0.3;
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Get.to(()=> const YapilacakEkran());
          },
          child: Container(
            alignment: Alignment.center,
            width: contWidth,
            height: contHeight,
            child: Stack(children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15.0,
                  sigmaY: 15.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "METAMASK",
                      style: GoogleFonts.ibmPlexMono(
                        color: const Color.fromARGB(169, 244, 246, 249),
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.07,
                child: Image.asset(
                  "lib/components/images/noise.jpg",
                  width: MediaQuery.of(context).size.width * contWidth,
                  height: MediaQuery.of(context).size.height * contHeight,
                  fit: BoxFit.cover,
                ),
              ),
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
                      color: Colors.white.withOpacity(0.2), width: 1.8),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0.25),
                    ],
                    stops: const [0.1, 1.0],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          "lib/components/images/logo/MetaMask.png",
                          height: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "lib/components/images/logo/MetaMask.png",
                          height: 80,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("ETH AĞI",
                              style: GoogleFonts.ibmPlexMono(
                                color: const Color.fromARGB(169, 244, 246, 249),
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                              )),
                        ),
                      )
                    ],
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
