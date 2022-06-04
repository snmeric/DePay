import 'dart:async';
import 'dart:io';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:de_pay/controllers/controller.dart';
import 'package:de_pay/view/choose_coin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:de_pay/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rive/rive.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  final ChooseCoinController _control = Get.put(ChooseCoinController());

String coinAdressName="";
  //KULLANICI ADRESİ
  final String contract = "0x17906d0028c464d303562f0450dbf5d780b9dc1b";
  //RIVE BIRD
  String animation = 'idle';
  Artboard? _birdArtboard;
  SMITrigger? trigger;
  StateMachineController? stateMachineController;

  //
  TextEditingController amount = TextEditingController();
  TextEditingController content = TextEditingController();
  var code = '';
  File? file;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('lib/components/animations/bird.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;

        //Kullanıcının adresi gelecek
       

        stateMachineController =
            StateMachineController.fromArtboard(artboard, 'State Machine 1');
        if (stateMachineController != null) {
          artboard.addController(stateMachineController!);
          trigger = stateMachineController!.findSMI('Pressed');
        }
        trigger = stateMachineController!.inputs.first as SMITrigger;
        setState(() => _birdArtboard = artboard);
      },
    );
  }

  void jump() {
    trigger?.fire();
  }
  
  void coinName(){
    if(_control.secilenCoin.value.toString()=='BTC'){
      coinAdressName='bitcoin';
    }
    else{
      coinAdressName='ethereum';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff3E436D)),
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
                      ],
                      controller: amount,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: IconButton(
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onPressed: amount.clear,
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.grey,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Iconsax.money,
                          color: kColorGreyText,
                        ),
                        hintText: '20\$',
                        hintStyle: TextStyle(color: kColorGreyText),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Center(child: Text('ASD',style:TextStyle(color: Colors.white,fontSize: 30),),),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(ChooseCoin());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(IconlyLight.arrowDown2, color: Colors.white),
                          Text(
                            _control.secilenCoin.value.toString(),
                            style: regularTextStyle,
                          ),
                        ],
                      )),
                  if (_birdArtboard == null)
                    const SizedBox()
                  else
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              coinName();
                              code = coinAdressName+":" +contract+
                                  '?amount='+amount.text;
                              code.toString().isNotEmpty ? jump() : SizedBox();
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                            });
                            Future.delayed(
                              const Duration(seconds: 1, milliseconds: 60),
                              () {
                                setState(() {
                                  code.toString().isNotEmpty
                                      ? ModalBar(context)
                                      : SizedBox();
                                });
                              },
                            );
                          },
                          child: SizedBox(
                            width: 300,
                            height: 300,
                            child: Rive(
                              artboard: _birdArtboard!,
                            ),
                          ),
                        ),
                      ],
                    ),
            
                  Text(
                    'Barkodu oluşturmak için kuşa dokunun.',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));
  }

  Future<dynamic> ModalBar(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: kBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        builder: (context) => Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.clear),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  Text(
                    'Barkod',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  code == ''
                      ? Text('')
                      : BarcodeWidget(
                          padding: EdgeInsets.all(8),
                          color: Colors.white,
                          decoration: BoxDecoration(),
                          barcode: Barcode.qrCode(
                            errorCorrectLevel: BarcodeQRCorrectionLevel.medium,
                          ),
                          data: '$code',
                          width: 200,
                          height: 200,
                        ),
                  Text(
                    "Girilen Adres: ",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.22,
                            color: const Color(0xff3E436D),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  children: [
                                    Text(
                                      code,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            FlutterClipboard.copy(code)
                                .then((value) => print('copied'));
                            Fluttertoast.showToast(
                                msg: "Kopyalandı",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          });
                        },
                        child: Icon(
                          Icons.copy,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
