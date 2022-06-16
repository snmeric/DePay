import 'package:de_pay/view/navigator_view.dart';
import 'package:de_pay/walletadd/model/network_type.dart';
import 'package:de_pay/walletadd/qrcode_reader_page.dart';
import 'package:de_pay/walletadd/service/configuration_service.dart';
import 'package:de_pay/walletadd/utils/route_utils.dart';
import 'package:de_pay/walletadd/wallet_create_page.dart';
import 'package:de_pay/walletadd/wallet_import_page.dart';
import 'package:de_pay/walletadd/wallet_main_page.dart';
import 'package:de_pay/walletadd/wallet_transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import 'context/setup/wallet_setup_provider.dart';
import 'context/transfer/wallet_transfer_provider.dart';
import 'context/wallet/wallet_provider.dart';
import 'intro_page.dart';

Map<String, WidgetBuilder> getRoutes(context) {
  return {
    '/': (BuildContext context) {
      final configurationService = Provider.of<ConfigurationService>(context);
      if (configurationService.didSetupWallet())
        return WalletProvider(
            // ignore: prefer_const_constructors
            builder: (context, store) => NaviScreen());

      return const IntroductionPage();
    },

     '/walletmainpage': (BuildContext context) {
      final configurationService = Provider.of<ConfigurationService>(context);
      if (configurationService.didSetupWallet())
        return WalletProvider(
            // ignore: prefer_const_constructors
            builder: (context, store) => WalletMainPage('Cüzdanım'));

      return const IntroPage();
    },
     
     
    '/create': (BuildContext context) =>
        WalletSetupProvider(builder: (context, store) {
          useEffect(() {
            store.generateMnemonic();
          }, []);

          // ignore: prefer_const_constructors
          return WalletCreatePage('Cüzdan Oluştur');
        }),
    '/import': (BuildContext context) => WalletSetupProvider(
          // ignore: prefer_const_constructors
          builder: (context, store) => WalletImportPage('Cüzdan Yükle'),
        ),
    '/transfer': (BuildContext context) => WalletTransferProvider(
          // ignore: prefer_const_constructors
          builder: (context, store) => WalletTransferPage(
            title: 'Token Gönder',
            network: getRouteArgs<NetworkType>(context),
          ),
        ),
    '/qrcode_reader': (BuildContext context) => QRCodeReaderPage(
          title: 'Qr Kod Okut',
          onScanned: ModalRoute.of(context)?.settings.arguments as OnScanned?,
        )
  };
}
