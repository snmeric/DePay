import 'package:de_pay/components/widgets/custom_button.dart';
import 'package:de_pay/pages/animation_ground.dart';
import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';


class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroductionSlider(
        onDone: IntroPage(),
        items: [
          IntroductionSliderItem(
            image: Image1(),
            title: "Kriptoyla Ödeme Yapın",
            description: "Ethereum Ağıyla hızlıca ödeme yapın.",
          ),
          IntroductionSliderItem(
            image: Image2(),
            title: "QR Ödeme",
            description: "QR kodla beklemeden ödemenizi yapabilirsiniz.",
          ),
          IntroductionSliderItem(
            image: Image3(),
            title: "Hızlıca Cüzdan Oluşturun",
            description: "Hemen kendi cüzdanını oluşturun.",
          ),
        ],
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                
               RiveAnimation.asset('lib/components/animations/marty-animation.riv',fit: BoxFit.cover,),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                       CustomButton(buttonPadding: 15,buttonText: 'Yeni bir cüzdan oluştur',onPressText: '/create',),
                       CustomButton(buttonPadding: 12,buttonText: 'Cüzdan Yükle',onPressText: '/import',),
                     
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Image1 extends StatelessWidget {
  const Image1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 150, child: Image.asset('lib/components/images/introduction/hand.png'));
  }
}

class Image2 extends StatelessWidget {
  const Image2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 150, child: Image.asset('lib/components/images/introduction/smiling.png'));
  }
}

class Image3 extends StatelessWidget {
  const Image3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 150, child: Image.asset('lib/components/images/introduction/rocket.png'));
  }
}