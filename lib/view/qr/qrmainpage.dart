import 'package:de_pay/walletadd/context/wallet/wallet_provider.dart';
import 'package:de_pay/walletadd/service/configuration_service.dart';
import 'package:de_pay/walletadd/wallet_main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../walletadd/intro_page.dart';

class QrMainPage extends StatefulWidget {
  QrMainPage({Key? key}) : super(key: key);

  @override
  State<QrMainPage> createState() => _QrMainPageState();
}

class _QrMainPageState extends State<QrMainPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
body:WalletProvider( builder: (context, store) => WalletMainPage('Cüzdanım')) ,

    );
  }
}

