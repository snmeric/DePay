import 'package:de_pay/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double buttonPadding;
  final String? buttonText;
  final Widget? child;
  final IconData? buttonIcon;
  final Function? onPressed;
  final String? onPressText;

  const CustomButton(
      {Key? key,
      required this.buttonPadding,
      this.buttonText,
      this.child,
      this.buttonIcon,
      this.onPressed, 
      this.onPressText
    
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: NeumorphicButton(
          onPressed: () {
            Navigator.of(context).pushNamed('$onPressText');
          },
          padding: EdgeInsets.all(buttonPadding),
          style: NeumorphicStyle(
            color: kButtonColor,
            shadowDarkColor:Colors.black,
            shadowLightColor: Colors.black54,
            depth: 3,
            intensity: 0.8,
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(13)),
          ),
          child: buttonText.toString().isEmpty
              ? Icon(
                  buttonIcon,
                  color: Colors.white,
                )
              : Text(
                  buttonText.toString(),
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                )),
    );
  }
}
