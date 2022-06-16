import 'package:de_pay/theme/constants.dart';
import 'package:de_pay/view/profil/profil_menu.dart';
import 'package:de_pay/view/profil/profil_resmi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfilSayfasi extends StatefulWidget {
  ProfilSayfasi({Key? key}) : super(key: key);

  @override
  State<ProfilSayfasi> createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Body(),
    );
  }
}






class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Hesabım",
            icon: IconlyLight.profile,
            press: () => {},
          ),
          ProfileMenu(
            text: "Bildirimler",
            icon: IconlyLight.notification,
            press: () {},
          ),
          ProfileMenu(
            text: "Ayarlar",
            icon: IconlyLight.setting,
            press: () {},
          ),
          ProfileMenu(
            text: "Yardım Merkezi",
            icon: IconlyLight.user2,
            press: () {},
          ),
          ProfileMenu(
            text: "Çıkış",
            icon: IconlyLight.logout,
            press: () {},
          ),
        ],
      ),
    );
  }
}