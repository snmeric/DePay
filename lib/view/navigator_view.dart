import 'dart:ui';
import 'package:de_pay/theme/constants.dart';
import 'package:de_pay/view/homescreen.dart';
import 'package:de_pay/view/kampanyalar/kampanya.dart';
import 'package:de_pay/view/piyasa/piyasa_page.dart';
import 'package:de_pay/view/profil/profil.dart';
import 'package:de_pay/view/qr/qr_page.dart';
import 'package:de_pay/view/qr/qrmainpage.dart';
import 'package:de_pay/walletadd/router.dart';
import 'package:de_pay/walletadd/wallet_main_page.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../walletadd/intro_page.dart';
import '../walletadd/service/configuration_service.dart';
import '../walletadd/wallet/wallet_provider.dart';

class NaviScreen extends StatefulWidget {
  const NaviScreen({Key? key}) : super(key: key);

  @override
  State<NaviScreen> createState() => _NaviScreenState();
}

class _NaviScreenState extends State<NaviScreen> {
  int _selectedIndex = 0;

  final screen = [
    const MyHomePage(),
    const PiyasaSayfasi(),
    QrMainPage(),
    Kampanyalar(),
    ProfilSayfasi()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screen[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 16,
              spreadRadius: 2,
              color: Colors.black.withOpacity(0.12),
            )
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 40.0,
                sigmaY: 40.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 30,
                        spreadRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.1), width: 1.5),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.15),
                          Colors.white.withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1.0
                        ])),
                child: BottomAppBar(
                  elevation: 0,
                  color: Colors.transparent,
                  child: SizedBox(
                    height: 66,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButtonBar(
                            text: 'Anasayfa',
                            selected: _selectedIndex == 0,
                            icon: IconlyBold.home,
                            icon2: IconlyLight.home,
                            onPressed: () {
                              setState(() {
                                _selectedIndex = 0;
                              });
                            },
                          ),
                          IconButtonBar(
                            text: 'Piyasa',
                            selected: _selectedIndex == 1,
                            icon: IconlyBold.chart,
                            icon2: IconlyLight.chart,
                            onPressed: () {
                              setState(() {
                                _selectedIndex = 1;
                              });
                            },
                          ),
                          IconButtonBar(
                            text: 'QR',
                            selected: _selectedIndex == 2,
                            icon: IconlyBold.scan,
                            icon2: IconlyLight.scan,
                            onPressed: () {
                              setState(() {
                                _selectedIndex = 2;
                              });
                            },
                          ),
                          IconButtonBar(
                            text: 'Kampanyalar',
                            selected: _selectedIndex == 3,
                            icon: IconlyBold.ticketStar,
                            icon2: IconlyLight.ticketStar,
                            onPressed: () {
                              setState(() {
                                _selectedIndex = 3;
                              });
                            },
                          ),
                          IconButtonBar(
                            text: 'Profil',
                            selected: _selectedIndex == 4,
                            icon: IconlyBold.profile,
                            icon2: IconlyLight.profile,
                            onPressed: () {
                              setState(() {
                                _selectedIndex = 4;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconButtonBar extends StatelessWidget {
  final String? text;
  final bool selected;
  final IconData icon;
  final IconData icon2;
  final Function() onPressed;

  const IconButtonBar({
    Key? key,
    this.text,
    required this.selected,
    required this.icon,
    required this.onPressed,
    required this.icon2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: onPressed,
            icon: Icon(
              selected ? icon : icon2,
              size: 25,
              color: selected ? kColorText : Colors.grey,
            ),
          ),
        ),
        /*Expanded(
          flex: 1,
          child: Text(
            text,
            style: GoogleFonts.poppins(
                color: selected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: .1),
          ),
        ),*/
      ],
    );
  }
}
