import 'package:de_pay/models/market_provider.dart';
import 'package:de_pay/pages/loading_screen.dart';
import 'package:de_pay/view/piyasa/coin_card.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:de_pay/models/model.dart';
import 'package:de_pay/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rive/rive.dart';
import 'package:card_loading/card_loading.dart';

class PiyasaSayfasi extends StatefulWidget {
  const PiyasaSayfasi({Key? key}) : super(key: key);

  @override
  State<PiyasaSayfasi> createState() => _PiyasaSayfasiState();
}

class _PiyasaSayfasiState extends State<PiyasaSayfasi> {
  final _offsetToArmed = 120.0;
  @override
  Widget build(BuildContext context) {
    final double conWidth = MediaQuery.of(context).size.width;
    final double conHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, __) => [
          SliverAppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              'Piyasa',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            snap: true,
            floating: true,
          )
        ],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              height: 40,
              width: conWidth * .8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff3E436D)),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    IconlyLight.search,
                    color: kColorGreyText,
                  ),
                  hintText: 'Ara',
                  hintStyle: TextStyle(color: kColorGreyText),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xff21212E)),
                  child: Consumer<MarketProvider>(
                      builder: (context, marketProvider, child) {
                    if (marketProvider.isLoading == true) {
                      return Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: Colors.white,
                          size: 20,
                        ),
                      );
                    } else {
                      // ignore: prefer_is_empty
                      if (marketProvider.markets.length > 0) {
                        return CustomRefreshIndicator(
                          offsetToArmed: _offsetToArmed,
                          onRefresh: ()async {
                            
                            await marketProvider.fetchData();
                            
                          },
                              
                          builder: (context, child, controller) =>
                              AnimatedBuilder(
                            animation: controller,
                            child: child,
                            builder: (context, child) {
                              return Stack(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: _offsetToArmed * controller.value,
                                    child: const RiveAnimation.asset(
                                      'lib/components/animations/refresh.riv',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(
                                        0.0, _offsetToArmed * controller.value),
                                    child: controller.isLoading
                                        ? ListView.builder(
                                          itemCount: 5,
                                            itemBuilder: (context, index) {
                                            return const CardLoading(
                                              height: 60,
                                              borderRadius: 15,
                                              width: double.infinity,
                                              margin: EdgeInsets.all(10),
                                              
                                              cardLoadingTheme:
                                                  CardLoadingTheme(
                                                      colorTwo:
                                                          kBackgroundColor,
                                                      colorOne: Colors.black38),
                                            );
                                          })
                                        : child,
                                  ),
                                ],
                              );
                            },
                          ),
                          child: AllCoin(marketProvider),
                        );
                      } else {
                        return const Text("Bir Sorun Oluştu!");
                      }
                    }
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ListView AllCoin(MarketProvider marketProvider) {
    return ListView.builder(
      
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: marketProvider.markets.length,
        itemBuilder: (context, index) {
          Coin coinler = marketProvider.markets[index];

          return GestureDetector(
            onTap: (){
              const YapilacakEkran();
            },
            child: CoinCard(
              name: coinler.name,
              symbol: coinler.symbol,
              imageUrl: coinler.imageUrl,
              price: coinler.price.toDouble(),
              change: coinler.change.toDouble(),
              changePercentage: coinler.changePercentage.toDouble(),
            ),
          );
        });
  }
}
