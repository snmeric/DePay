import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,20,30,20),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Column(
              children: [
               Image.asset('components/images/3.png',fit: BoxFit.cover,),
                
              ],
            )),
      ),
    );
  }
}
