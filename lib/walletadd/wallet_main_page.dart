import 'package:de_pay/theme/constants.dart';
import 'package:de_pay/walletadd/components/wallet/balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:sizer/sizer.dart';

import 'components/dialog/alert.dart';
import 'components/menu/main_menu.dart';
import 'components/wallet/change_network.dart';
import 'context/wallet/wallet_provider.dart';

class WalletMainPage extends HookWidget {
  const WalletMainPage(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final store = useWallet(context);
    final address = store.state.address;
    final network = store.state.network;

    useEffect(() {
      store.initialise();
    }, []);

    useEffect(
      () => store.listenTransfers(address, network),
      [address, network],
    );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: MainMenu(
        
        network: network,
        address: address,
        onReset: () => Alert(
            title: 'UYARI',
            text:
                'Anahtar cümleniz veya özel anahtarınız olmadan cüzdan bakiyenizi geri yükleyemezsiniz.',
            actions: [
              TextButton(
                child: const Text('İptal et'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('Çıkış Yap'),
                onPressed: () async {
                  await store.resetWallet();
                  Navigator.popAndPushNamed(context, '/');
                },
              )
            ]).show(context),
        onRevealKey: () => Alert(
            title: 'Özel Anahtar',
            text:
                'UYARI: Dikkatli olun özel anahtar parolanızdır.\r\n\r\n${store.getPrivateKey() ?? "-"}',
            actions: [
              TextButton(
                child: const Text('Kapat'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('Kopyala ve kapat'),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: store.getPrivateKey()));
                  Navigator.of(context).pop();
                },
              ),
            ]).show(context),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0,centerTitle: true,
        title: Text(title),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: !store.state.loading
                  ? () async {
                      await store.refreshBalance();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Bakiye Güncellendi'),
                        duration: Duration(milliseconds: 800),
                      ));
                    }
                  : null,
            ),
          ),
          IconButton(
            icon:  const Icon(IconlyBold.send),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/transfer', arguments: store.state.network);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 5.h,),
              ChangeNetwork(
                onChange: store.changeNetwork,
                currentValue: store.state.network,
                loading: store.state.loading,
              ),
             SizedBox(height: 10.h,),
              Balance(
                address: store.state.address,
                ethBalance: store.state.ethBalance,
                tokenBalance: store.state.tokenBalance,
                symbol: network.config.symbol,
              )
            ],
          ),
        ),
      ),
    );
  }
}
