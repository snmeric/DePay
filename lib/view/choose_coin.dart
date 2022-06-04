import 'package:de_pay/controllers/controller.dart';
import 'package:de_pay/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseCoin extends StatefulWidget {
  @override
  State<ChooseCoin> createState() => _ChooseCoinState();
}



class _ChooseCoinState extends State<ChooseCoin> {
  final ChooseCoinController ctrl = Get.put(ChooseCoinController());
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kripto Para Seçin',
          style: regularTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
           
            Navigator.pop(context);
          },
          icon: Icon(IconlyLight.arrowLeftSquare),
          color: Colors.white,
          iconSize: 30,
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                
                  ctrl.secilenCoin.value='ETH';
                  Navigator.pop(context);
                
              },
              child: Card(
                color: kBackgroundSecondaryColor,
                child: ListTile(
                  leading:
                      Image.asset("lib/components/images/coins/ethereum_R.png"),
                  title: const Text('ETH',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                
                  ctrl.secilenCoin.value='BTC';
                  Navigator.pop(context);
               
              },
              child: Card(
                  color: kBackgroundSecondaryColor,
                  child: ListTile(
                    leading: Image.asset(
                        "lib/components/images/coins/bitcoin_R.png"),
                    title: const Text(
                      'BTC',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
