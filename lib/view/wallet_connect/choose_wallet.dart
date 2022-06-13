import 'package:de_pay/theme/constants.dart';
import 'package:de_pay/view/wallet_connect/wallet_conn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChooseWallet extends StatefulWidget {
  ChooseWallet({Key? key}) : super(key: key);

  @override
  State<ChooseWallet> createState() => _ChooseWalletState();
}

class _ChooseWalletState extends State<ChooseWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cüzdan Bağla',
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cüzdanınızı bağladınız mı?",
                style: medGreyTextStyle,
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>WalletConn());
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        color: kBackgroundSecondaryColor,
                        width: 80.w,
                        height: 8.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Image.asset(
                                  "lib/components/images/logo/MetaMask.png",
                                  height: 7.h,
                                ),
                              ),
                            ),
                            
                            Text('Metamaskı Bağla',style: regularTextStyle,)
                            ,Icon(IconlyLight.arrowRight2,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
