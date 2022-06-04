import 'package:card_loading/card_loading.dart';
import 'package:coingecko_api/data/market_data.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:de_pay/components/widgets/appbar.dart';
import 'package:de_pay/models/model.dart';
import 'package:de_pay/pages/animation_ground.dart';
import 'package:de_pay/pages/coin_home.dart';
import 'package:de_pay/theme/constants.dart';
import 'package:de_pay/view/wallet_connect/add_card.dart';
import 'package:de_pay/view/wallet_connect/my_card.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:de_pay/models/market_provider.dart';
import 'package:coingecko_api/coingecko_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isAppBar = true;
  final ScrollController _scroolController = ScrollController();
  final _controller = PageController();
  final _offsetToArmed = 120.0;
var coinlerList=[];
  @override
  RxList cryptoCharts = [].obs;

  String periodID = '1DAY';

  DateFormat format = DateFormat('yyyy-MM-dd HH:MM');
  void forceBalanceToRefresh() {
    setState(() {
      cryptoCharts = cryptoCharts;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    //SmoothPageIndıcator
    final _controller = PageController();
    int cryptoindex = 0;
    final Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.70;
    double contHeight = size.height * 0.25;

    return Scaffold(
      //backgroundColor: Colors.red,
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff2C2E3B),

      //Appbar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: MyGlassAppbar(),
      ),
      //BODY

      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                //BackgroundsCustomPaint(),
                AniBackground(),

                Column(
                  //clipBehavior: Clip.none,

                  children: [
                    //ANASAYFA ilk resimler kaydirmali
                    /*   Flexible(
                      flex: 3,
                      child: ListView(
                        controller: _scroolController,
                        children: [
                          //SizedBox
                          const SizedBox(
                            height: 10,
                          ),
                    
                          CarouselSlider(
                            items: [
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: AssetImage(tanitim4),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: AssetImage(tanitim1),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: AssetImage(tanitim2),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: AssetImage(tanitim3),
                                        fit: BoxFit.cover)),
                              )
                            ],
                            options: CarouselOptions(
                              height: 200,
                              autoPlay: true,
                              //autoPlayCurve: Curves.easeInOut,
                              enlargeCenterPage: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    */

                    SizedBox(height: 12.h),
                    Container(
                      height: contHeight,
                      alignment: Alignment.center,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        children: const [
                          MyCard(),
                          AddWallet(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 2,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Colors.white,
                        dotHeight: 10,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),

                    //COINLER

                    Consumer<MarketProvider>(
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
                          return RefreshIndicator(
                            onRefresh: () async {
                              await marketProvider.fetchData();
                            },
                            child: Container(
                              height: 15.h,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.only(left: 31),
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                children: [
                                  coinler(marketProvider, 0),
                                  coinler(marketProvider, 1),
                                  coinler(marketProvider, 4),
                                  coinler(marketProvider, 5),
                                  coinler(marketProvider, 6),
                                  coinler(marketProvider, 13),
                                  coinler(marketProvider, 9),
                                  coinler(marketProvider, 10),
                                  coinler(marketProvider, 15),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return const Text("Bir Sorun Oluştu!");
                        }
                      }
                    })
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CoinHome coinler(MarketProvider marketProvider, int cryptoindex) {
    return CoinHome(
      name: marketProvider.markets[cryptoindex].name,
      symbol: marketProvider.markets[cryptoindex].symbol,
      imageUrl: marketProvider.markets[cryptoindex].imageUrl,
      price: marketProvider.markets[cryptoindex].price.toDouble(),
      change: marketProvider.markets[cryptoindex].change.toDouble(),
      changePercentage:
          marketProvider.markets[cryptoindex].changePercentage.toDouble(),
    );
  }
}
