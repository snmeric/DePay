// ignore_for_file: prefer_const_constructors
import 'dart:ui';
import 'package:de_pay/components/add_card.dart';
import 'package:de_pay/pages/animation_ground.dart';
import 'package:de_pay/pages/coin_home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:de_pay/components/my_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

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
    //SmoothPageIndıcator
    final _controller = PageController();

    final Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.70;
    double contHeight = size.height * 0.25;

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
                                      Colors.white.withOpacity(0.15),
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
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                //BackgroundsCustomPaint(),
                AniBackground(),

                Column(
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

                    SizedBox(height: 90),
                    Container(
                      height: contHeight,
                      alignment: Alignment.center,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        children: const [
                          MyCard(),
                          AddWallet(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 2,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.white,
                        dotHeight: 10,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    CoinHome(
                      coinAdi: "Bitcoin",
                      fiyati: 42250,
                      degisim: 15.6,
                      artmisMi: true,
                    ),
                    //LineChartSample2()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
