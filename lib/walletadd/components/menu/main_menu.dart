import 'package:de_pay/walletadd/model/network_type.dart';
import 'package:de_pay/walletadd/utils/wallet_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:url_launcher/url_launcher.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    Key? key,
    required this.address,
    required this.network,
    required this.onReset,
    required this.onRevealKey,
  }) : super(key: key);

  final String? address;
  final NetworkType network;
  final GestureTapCallback? onReset;
  final GestureTapCallback? onRevealKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Token Al'),
            subtitle: const Text('Bazı test jetonlarını talep edin'),
            trailing: const Icon( IconlyBold.arrowRightSquare),
            onTap: () async {
              final url =
                  'https://faucet.clempe.dev?address=$address&network=${network.name.toLowerCase()}';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
            title: Text('${network.config.symbol} Al'),
            subtitle: Text('Bazı ${network.config.symbol} testlerini talep edin'),
            trailing: Icon( IconlyBold.arrowRightSquare),
            onTap: () async {
              final url = network.config.faucetUrl;
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
              title: const Text('Özel Anahtar'),
              subtitle: const Text('Özel anahtarınızı ortaya çıkarın!'),
              trailing: const Icon(
                IconlyBold.ticketStar
              ),
              onTap: onRevealKey),
          ListTile(
              title: const Text('Cüzdanı Resetletin'),
              subtitle: const Text('Tüm cüzdan verilerini silin'),
              trailing: const Icon(
               Icons.restore_from_trash
              ),
              onTap: onReset),
        ],
      ),
    );
  }
}
