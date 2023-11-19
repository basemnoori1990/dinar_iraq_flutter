import 'package:dinar_iraq/providers/address_provider.dart';
import 'package:dinar_iraq/providers/cart_provider.dart';
import 'package:dinar_iraq/providers/categories_provider.dart';
import 'package:dinar_iraq/providers/companies_provider.dart';
import 'package:dinar_iraq/providers/login_provider.dart';
import 'package:dinar_iraq/providers/products_provider.dart';
import 'package:dinar_iraq/providers/user_provider.dart';
import 'package:dinar_iraq/utilis/app_functions.dart';
import 'package:dinar_iraq/views/bottom_navigation_bar_view.dart';
import 'package:dinar_iraq/views/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await AppFunctions.configureDependencies();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(0.0),
    ),
  );
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', ''),
      Locale('ar', ''),
    ],
    startLocale: const Locale('ar'),
    path: 'assets/resources/langs',
    fallbackLocale: const Locale('ar', ''),
    child: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => AddressProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (context) => CompaniesProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (context) => CategoriesProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (context) => ProductsProvider(),
        lazy: false,
      ),
    ], child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'دينار',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider.of<UserProvider>(context, listen: false).user == null
          ? const LoginView()
          : const MyHoomePage(),
    );
  }
}
