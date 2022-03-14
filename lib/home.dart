import 'dart:ui';
import 'dart:ui' as ui;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:de_pay/pages/backgrounds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
     // backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,

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
                  flexibleSpace: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(40)),
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
                )
              : const PreferredSize(
                  child: SizedBox(), preferredSize: Size.zero),
        ),
      ),

      //BODY
      body: Stack(
        clipBehavior: Clip.none, children: [
        Positioned(
          left: 200,
          top: 300,
          child: CustomPaint(
            size: Size(size.width*0.5, (size.width*0.5).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),

          ),
        ),
          ListView(
            controller: _scroolController,
            children: [
              //SizedBox
              const SizedBox(
                height: 10,
              ),

              //ANASAYFA ilk resimler kaydirmali
              CarouselSlider(
                items: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage(tanitim4), fit: BoxFit.cover)),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage(tanitim1), fit: BoxFit.cover)),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage(tanitim2), fit: BoxFit.cover)),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage(tanitim3), fit: BoxFit.cover)),
                  )
                ],
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  //autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File

