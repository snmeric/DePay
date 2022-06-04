import 'package:de_pay/chart_test/api_call.dart';
import 'package:de_pay/chart_test/chart_ho.dart';
import 'package:de_pay/chart_test/crypto_pair_model.dart';
import 'package:de_pay/chart_test/cryptocurrencies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';
import 'package:intl/intl.dart';

class Chome extends StatefulWidget {
  const Chome({Key? key}) : super(key: key);

  @override
  _ChomeState createState() => _ChomeState();
}

class _ChomeState extends State<Chome> {
  double balance = 66032206.10;
  double profit = 35.22;
  double profitPercent = 0.22;
  @override
  void initState() {
    getCharts();
    super.initState();
  }

  RxList cryptoCharts = [].obs;

  String periodID = '<1DAY>';
  getCharts() async {
    for (var i = 0; i < cryptocurrencies.length; i++) {
      cryptoCharts.add(
        {
          'cryptoPairModel': cryptocurrencies[i],
          'chartSpots': await ApiCalls().getChart(
            cryptocurrencies[i].cryptoBase,
            cryptocurrencies[i].exchangeCurrency,
            periodID,
            DateTime.now().subtract(const Duration(days: 7)),
            DateTime.now(),
          ),
        },
      );
    }
  }

  DateFormat format = DateFormat('yyyy-MM-dd HH:MM');
  void forceBalanceToRefresh() {
    setState(() {
      cryptoCharts = cryptoCharts;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: ListView(
            children: [
              Obx(
                () => cryptoCharts.isEmpty
                    ? SizedBox(
                        width: 15.w,
                        height: 10.h,
                        child: Align(
                         
                          child: Center(
                          child: LoadingAnimationWidget.inkDrop(
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cryptoCharts.length,
                        itemBuilder: (BuildContext context, int i) {
                          CryptoPairModel cryptoPairModel =
                              cryptoCharts[i]['cryptoPairModel'];

                          return chartHomePage(
                            true,
                           
                            cryptoPairModel.cryptoName,
                            cryptoPairModel.cryptoBase,
                            cryptoPairModel.exchangeCurrency,
                            cryptoCharts[i]['chartSpots'],
                            themeData,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),);
  }
}
