import 'package:de_pay/models/market_provider.dart';
import 'package:de_pay/theme/constants.dart';
import 'package:de_pay/view/navigator_view.dart';
import 'package:de_pay/walletadd/router.dart';
import 'package:de_pay/walletadd/services_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sizer/sizer.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 final stores = await createProviders();
  runApp(
    
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MarketProvider>(
          create: (_) => MarketProvider(),
        ),
      ],
      child: MyApp(stores),
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
  const MyApp(this.stores, {Key? key}) : super(key: key);

  final List<SingleChildWidget> stores;   
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    return MultiProvider(
      providers: stores,
      child: Sizer(
          builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) {
            return GetMaterialApp(
               initialRoute: '/',
               routes: getRoutes(context),
              debugShowCheckedModeBanner: false,
              title: 'DePay',
              theme: ThemeData(backgroundColor: kBackgroundColor),
         
              
            );
          },
       
      ),
    );
  }
}
