import 'package:de_pay/models/market_provider.dart';
import 'package:de_pay/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'view/navigator_view.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MarketProvider>(
          create: (_) => MarketProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );

//    runApp(const MyApp(MultiProvider(
//       providers: [
//         ChangeNotifierProvider<MarketProvider>(
//           create: (context) => MarketProvider(),
//         )
//       ],),);
// }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DePay',
          theme: ThemeData(backgroundColor: kBackgroundColor),
          home: NaviScreen(),
        );
      },
    );
  }
}
