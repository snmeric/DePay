
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

class ChartHomePage extends StatefulWidget {
  const ChartHomePage({Key? key}) : super(key: key);

  @override
  _ChartHomePageState createState() => _ChartHomePageState();
}

class _ChartHomePageState extends State<ChartHomePage> {
  double balance = 66032206.10;
  double profit = 35.22;
  double profitPercent = 0.22;
  @override
  void initState() {
    getCharts();
    super.initState();
  }

  RxList cryptoCharts = [].obs;

  String periodID = '1DAY';
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
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: themeData.backgroundColor,
          leading: SizedBox(
            height: 10.w,
            width: 15.w,
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: 15.w,
          title: Image.asset(
            themeData.brightness == Brightness.light
                ? 'assets/sobGOGdark.png'
                : 'assets/sobGOGlight.png',
            height: 3.5.h,
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: SizedBox(
                height: 3.5.h,
                width: 10.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    UniconsLine.bell,
                    color: themeData.primaryColor,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: ListView(
            children: [
           
             
              Obx(
                () => cryptoCharts.isEmpty
                    ? SizedBox(
                        width: 80.w,
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
        ),
      ),
    );
  }
}