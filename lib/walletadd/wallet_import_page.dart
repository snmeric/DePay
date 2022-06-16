import 'package:de_pay/theme/constants.dart';
import 'package:de_pay/walletadd/components/wallet/import_wallet_form.dart';
import 'package:de_pay/walletadd/context/setup/wallet_setup_provider.dart';
import 'package:de_pay/walletadd/model/wallet_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WalletImportPage extends HookWidget {
  const WalletImportPage(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final store = useWalletSetup(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          title,
          style: mediumTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ImportWalletForm(
        errors: store.state.errors?.toList(),
        onImport: !store.state.loading
            ? (type, value) async {
                switch (type) {
                  case WalletImportType.mnemonic:
                    if (!await store.importFromMnemonic(value)) {
                      return;
                    }
                    break;
                  case WalletImportType.privateKey:
                    if (!await store.importFromPrivateKey(value)) {
                      return;
                    }
                    break;
                  default:
                    break;
                }

                Navigator.of(context).popAndPushNamed('/');
              }
            : null,
      ),
    );
  }
}
