import 'package:de_pay/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CoinCard extends StatelessWidget {
  CoinCard({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
  });

  String name;
  String symbol;
  String imageUrl;
  double price;
  double change;
  double changePercentage;

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat('###.##', 'en_US'); 



    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(20),
                 
              ),
              height: 55,
              width: 55,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect
                (borderRadius: BorderRadius.circular(10),
                  child: Image.network(imageUrl)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      name,
                      style: mediumTextStyle
                    ),
                  ),
                  Text(
                    symbol.toUpperCase(),
                    style: minGreyTextStyle
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price.toDouble().toString(),
                  style: mediumTextStyle
                ),
              
                Text(
                  changePercentage.toDouble() < 0
                      ? f.format(changePercentage.toDouble()).toString() + '%'
                      : '+' +f.format(changePercentage.toDouble()) .toString() + '%',
                  style: GoogleFonts.poppins(
                    
                    color: changePercentage.toDouble() < 0
                        ? Colors.redAccent
                        : Colors.greenAccent,
                       
                        
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}