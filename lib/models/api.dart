import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static Future<List<dynamic>> getMarkets() async {
    String url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
    var response = await http.get(Uri.parse(url));

    var decodedResponse = jsonDecode(response.body);

    List<dynamic> markets = decodedResponse as List<dynamic>;

    return markets;
  }
}
