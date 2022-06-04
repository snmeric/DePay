import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Map<String, String> headers = {
  // "X-CoinAPI-Key": "370732D8-221E-432F-87E7-5C77EBBF9412",
  "X-CoinAPI-Key": "A21D44AC-8943-46C6-8D2C-7268F869294E",

  
};

class ApiCalls extends GetConnect {
  Future<List<FlSpot>> getChart(
    String cryptoBase,
    String exchangeCurrency,
    String periodID,
    DateTime timeStart,
    DateTime timeEnd,
  ) async {
    DateFormat format = DateFormat('yyyy-MM-dd HH:MM');
    String timeStartStr =
        format.format(timeStart).toString().replaceAll(' ', 'T');
    String timeEndStr = format.format(timeEnd).toString().replaceAll(' ', 'T');
    List<FlSpot> spots = [];
    Response response = await get(
      'https://rest.coinapi.io/v1/exchangerate/$cryptoBase/$exchangeCurrency/history?period_id=$periodID&time_start=$timeStartStr&time_end=$timeEndStr',
      headers: headers,
    );

    var ratesCount1 = response.body;
    // debugPrint(ratesCount);

  List<dynamic> ratesCount=ratesCount1 as List<dynamic>;
    //add spots
    if (response.statusCode == 200) {
      for (var i = 0; i < ratesCount.length; i++) {
        spots.add(
          FlSpot(
            i.toDouble(),
            double.parse(response.body[i]['rate_close'].toStringAsFixed(6)),
          ),
        );
      }
    } else {
      throw ("Hata!"); // error thrown
    }
    return spots;
  }
}
