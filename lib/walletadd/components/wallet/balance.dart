import 'package:barcode_widget/barcode_widget.dart';
import 'package:de_pay/theme/constants.dart';
import 'package:de_pay/walletadd/components/copyButton/copy_button.dart';
import 'package:de_pay/walletadd/utils/eth_amount_formatter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class Balance extends StatelessWidget {
  const Balance({
    Key? key,
    required this.address,
    required this.ethBalance,
    required this.tokenBalance,
    required this.symbol,
  }) : super(key: key);

  final String? address;
  final BigInt? ethBalance;
  final BigInt? tokenBalance;
  final String? symbol;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Adresiniz:',style: regularTextStyle,),
          Text(address ?? '' ,style: minTextStyle,),
          const SizedBox(height: 3),
          CopyButton(
            text:  Text('Adresi Kopyala',style: minTextStyle,),
            value: address,
          ),
          if (address != null &&
              (mediaQuery.orientation == Orientation.portrait || kIsWeb))
            BarcodeWidget(
              padding: EdgeInsets.all(8),
              color: Colors.white,
              decoration: BoxDecoration(),
              barcode: Barcode.qrCode(
                errorCorrectLevel: BarcodeQRCorrectionLevel.medium,
              ),
              data: address!,
              width: 200,
              height: 200,
            ),
          Text(
            '${EthAmountFormatter(tokenBalance).format()} Token',
            style:
                Theme.of(context).textTheme.bodyText2?.apply(fontSizeDelta: 15,color: Colors.white,),
          ),
          Text(
            '${EthAmountFormatter(ethBalance).format()} $symbol',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.apply(color: Colors.blueGrey,fontSizeDelta: 13),
          )
        ],
      ),
    );
  }
}
