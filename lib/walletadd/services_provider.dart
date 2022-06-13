import 'package:de_pay/walletadd/service/address_service.dart';
import 'package:de_pay/walletadd/service/configuration_service.dart';
import 'package:de_pay/walletadd/service/contract_locator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:de_pay/models/api.dart';
import 'package:de_pay/models/model.dart';
import 'package:flutter/cupertino.dart';

import '../models/model.dart';

Future<List<SingleChildWidget>> createProviders() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  final configurationService = ConfigurationService(sharedPrefs);

  final addressService = AddressService(configurationService);

  final contractLocator = await ContractLocator.setup();

  //final marketProvider = await MarketProvider();


  return [
    Provider.value(value: addressService),
    Provider.value(value: contractLocator),
    Provider.value(value: configurationService),
    // ChangeNotifierProvider<MarketProvider>(
    //       create: (_) => MarketProvider(),
    //      ),
  ];
}

// class MarketProvider with ChangeNotifier {
//   bool isLoading = true;
//   List<Coin> markets = [];

//   MarketProvider() {
//     fetchData();
//   }
//   Future<void> fetchData() async {
//     List<dynamic> _markets = await API.getMarkets();
//     List<Coin> temp = [];
//     await Future.delayed(const Duration(seconds: 2));
//     for (var market in _markets) {
//       Coin newCoin = Coin.fromJson(market);
//       temp.add(newCoin);
//     }
//     markets = temp;
//     isLoading = false;

//     notifyListeners();
   
   
//   }
// }
