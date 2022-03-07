import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   bool _isAppBar=true;
   final ScrollController _scroolController=ScrollController();

  @override

  @override
  void initState() {
    _scroolController.addListener(() {
      if(_scroolController.position.userScrollDirection==
      ScrollDirection.reverse){
        setState(() {
          _isAppBar=false;
        });
      } else if (_scroolController.position.userScrollDirection==
      ScrollDirection.forward){
        setState(() {
          _isAppBar=true;
        });
      }
    });
    super.initState();
    
  }
  Widget build(BuildContext context) {


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(kToolbarHeight),
        child: AnimatedContainer(duration: Duration(milliseconds:200 ),height: _isAppBar?kToolbarHeight+MediaQuery.of(context).padding.top:0,
          child: _isAppBar 
          
          ? AppBar(
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(color: Colors.transparent,),
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
          ):const PreferredSize(child: SizedBox(), preferredSize: Size.zero),
        ),
      ),
      body: Center(
        
        child: SingleChildScrollView(
          controller: _scroolController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('components/images/3.png'),
              Image.asset('components/images/4.png'),
              Image.asset('components/images/2.png'),
            ],
          ),
        ),
      ),
    );
  }
}
