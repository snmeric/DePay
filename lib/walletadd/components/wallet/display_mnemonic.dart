
import 'package:de_pay/theme/constants.dart';
import 'package:de_pay/walletadd/components/copyButton/copy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DisplayMnemonic extends HookWidget {
  const DisplayMnemonic({Key? key, required this.mnemonic, this.onNext})
      : super(key: key);

  final String mnemonic;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 420),
        margin: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Bir kağıt parçası alın, Anahtar cümlenizi yazın ve güvende tutun. Paranızı kurtarmanın tek yolu bu.',
                textAlign: TextAlign.center, style: minTextStyle,
              ),
              Container(
                //color: Colors.white,
                
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all()),
                child: Text(mnemonic, textAlign: TextAlign.center ,style: minTextStyle,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CopyButton(text: const Text('Kopyala'), value: mnemonic),
                  ElevatedButton(child: const Text('İlerle'), onPressed: onNext)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
