import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Yeni bir cüzdan oluştur'),
              onPressed: () {
                Navigator.of(context).pushNamed('/create');
              },
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: OutlinedButton(
                child: const Text('Cüzdan Yükle'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/import');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
