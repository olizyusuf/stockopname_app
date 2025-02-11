import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:stockopname/model/license.dart';
import 'package:stockopname/provider/license_provider.dart';
import 'package:stockopname/provider/stock_provider.dart';
import 'package:stockopname/screen/home_screen.dart';
import 'package:stockopname/screen/license_screen.dart';
import 'package:stockopname/screen/setting_screen.dart';
import 'package:stockopname/screen/splash_screen.dart';

import 'model/stock.dart';

void main() async {
  Hive
    ..initFlutter()
    ..registerAdapter(StockAdapter())
    ..registerAdapter(LicenseAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StockProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LicenseProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stock Opname',
        home: const SplashScreen(),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/setting': (context) => const SettingScreen(),
          '/license': (context) => const LicenseScreen(),
        },
      ),
    );
  }
}
