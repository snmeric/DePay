import 'package:carousel_slider/carousel_slider.dart';
import 'package:de_pay/theme/constants.dart';
import 'package:flutter/material.dart';


class Kampanyalar extends StatefulWidget {
  Kampanyalar({Key? key}) : super(key: key);

  @override
  State<Kampanyalar> createState() => _KampanyalarState();
}

class _KampanyalarState extends State<Kampanyalar> {
  @override
  Widget build(BuildContext context) {
      final ScrollController _scroolController = ScrollController();
    return Scaffold(
      backgroundColor: kBackgroundColor,
       appBar: AppBar(title: Text('Kampanyalar',style: mediumTextStyle,),centerTitle: true,backgroundColor: Colors.transparent,elevation: 0,),
      body: Column(children: [
         //ANASAYFA ilk resimler kaydirmali
                       Flexible(
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
                                decoration: BoxDecoration(
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
 
                   Flexible(
                    flex: 6,
                    child: ClipRRect(borderRadius: BorderRadius.circular(20), child: SizedBox(height: 225, child: Image.asset(tanitim4,fit: BoxFit.cover,))),
                                
                              ),
                              
                    
      ]),
    );
  }
}