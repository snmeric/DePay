
import 'package:de_pay/chart_test/chart_detail.dart';
import 'package:de_pay/chart_test/linear_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Padding chartHomePage(
  bool isHomePage,
 
  String cryptoName,
  String cryptoCode,
  String exchangeCurrency,
  List<FlSpot> spots,
  ThemeData themeData,
) {
  Rx<double> minY = 0.0.obs;
  Rx<double> maxY = 0.0.obs;
  List sortedSpots = spots.toList();
  sortedSpots.sort((a, b) => a.y.compareTo(b.y));
  minY.value = sortedSpots.first.y;
  maxY.value = sortedSpots.last.y;
  double profitPercent =
      ((spots.last.y - spots[spots.length - 2].y) / spots[spots.length - 2].y) *
          100;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: GestureDetector(
        onTap: () => Get.to(
          () => DetailsPage(
            
            spots: spots,
            profitPercent: profitPercent,
            maxY: maxY.value,
            minY: minY.value,
            cryptoCode: cryptoCode,
            cryptoName: cryptoName,
            exchangeCurrency: exchangeCurrency,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: 2.w,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
                      Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: SizedBox(
                          width: 50.w,
                          child: Text(
                            '$cryptoName ($cryptoCode) - $exchangeCurrency',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h, bottom: 3.h),
                  child: SizedBox(
                    width: 90.w,
                    height: 10.h,
                    child: Obx(
                      () => LineChart(chart(
                        isHomePage,
                        spots,
                        minY.value,
                        maxY.value,
                        7,
                        profitPercent >= 0,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}