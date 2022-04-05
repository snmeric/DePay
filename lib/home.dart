import 'dart:ui' as ui;
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:de_pay/components/frosted_glass.dart';
import 'package:de_pay/pages/backgrounds_custompaint.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isAppBar = true;
  final ScrollController _scroolController = ScrollController();
  final _controller = PageController();

  @override
  void initState() {
    _scroolController.addListener(() {
      if (_scroolController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isAppBar = false;
        });
      } else if (_scroolController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isAppBar = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.70;
    double contHeight = size.height * 0.3;

    return Scaffold(
      //backgroundColor: Colors.red,
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff2C2E3B),

      //Appbar
      appBar: PreferredSize(
        
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: _isAppBar
              ? kToolbarHeight + MediaQuery.of(context).padding.top
              : 0,
          child: _isAppBar
              ? AppBar(
                
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.fromLTRB(120, 22, 120, 0),
                    child: Container(
                      
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
                                    color: Colors.white.withOpacity(0.1),
                                    width: 1.5),
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
                          ),
                        ),
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  centerTitle: true,
                  title: RichText(
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
                )
              : const PreferredSize(
                  child: SizedBox(), preferredSize: Size.zero),
        ),
      ),

      //BODY
      body: Stack(
        children: [
          //BACKGROUND
          Stack(
            children: const [
              BackgroundsCustomPaint(
                left: -180,
                top: 200,
                size: 400,
              ),
              BackgroundsCustomPaint(
                left: 180,
                top: 20,
                size: 500,
              ),
              BackgroundsCustomPaint(
                left: 120,
                top: -200,
                size: 300,
              ),
              BackgroundsCustomPaint(
                left: 0,
                top: 400,
                size: 600,
              ),
            ],
          ),

          //ANASAYFA

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              //clipBehavior: Clip.none,
              children: [
                //ANASAYFA ilk resimler kaydirmali
                /*   Flexible(
                  flex: 3,
                  child: ListView(
                    controller: _scroolController,
                    children: [
                      //SizedBox
                      const SizedBox(
                        height: 10,
                      ),
          
                      CarouselSlider(
                        items: [
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: AssetImage(tanitim4),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: AssetImage(tanitim1),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: AssetImage(tanitim2),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: AssetImage(tanitim3),
                                    fit: BoxFit.cover)),
                          )
                        ],
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          //autoPlayCurve: Curves.easeInOut,
                          enlargeCenterPage: true,
                        ),
                      ),
                    ],
                  ),
                ),
          */
                //Coinler

                //FROSTED GLASS History
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FrostedGlass(
                      width: contWidth,
                      height: contHeight,
                      child: Container(),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
