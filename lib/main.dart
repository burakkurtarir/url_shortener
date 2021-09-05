import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/core/init/database/database_manager.dart';
import 'package:url_shortener/core/init/providers/application_provider.dart';
import 'package:url_shortener/view/splash/view/splash_view.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseManager.databaseInit();

  runApp(
    MultiProvider(
      providers: [
        ...ApplicationProvider.instance.dependItems,
        ...ApplicationProvider.instance.uiChangeItems,
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Shortener',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'PublicSans',
        scaffoldBackgroundColor: Color(0xffEFF1F7),
        textTheme: TextTheme(
          headline4: TextStyle(
            color: Color(0xff35323E),
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
          headline5: TextStyle(
            color: Color(0xff35323E),
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
          headline6: TextStyle(
            color: Color(0xff35323E),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      home: SplashView(),
    );
  }
}
