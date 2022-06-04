import 'dart:async';

import 'package:de_pay/models/api.dart';
import 'package:de_pay/models/model.dart';
import 'package:flutter/cupertino.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<Coin> markets = [];

  MarketProvider() {
    fetchData();
  }
  Future<void> fetchData() async {
    List<dynamic> _markets = await API.getMarkets();
    List<Coin> temp = [];
    await Future.delayed(const Duration(seconds: 2));
    for (var market in _markets) {
      Coin newCoin = Coin.fromJson(market);
      temp.add(newCoin);
    }
    markets = temp;
    isLoading = false;

    notifyListeners();
   
   
  }
}
