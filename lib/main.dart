import 'package:flutter/material.dart';
import 'package:skt_photo_gallery/app_config.dart';
import 'package:skt_photo_gallery/src/presentation/splash_screen/splash_screen.dart';
import 'package:skt_photo_gallery/src/route/route_generator.dart';

// void main() {
//   runApp(const MyApp());
// }

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otto International Photo Gellary',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner:
          AppConfig.of(context).appEnvironment == AppEnvironment.DEV,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const SplashScreen(),
    );
  }
}
