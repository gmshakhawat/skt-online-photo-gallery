import 'package:flutter/material.dart';
import 'package:skt_photo_gallery/app_config.dart';
import 'package:skt_photo_gallery/main.dart';
import 'package:skt_photo_gallery/src/constents/app_images.dart';
import 'package:skt_photo_gallery/src/dependency_injection/injector.dart';

void main() {
  Injector.setup();
  var appconfig = AppConfig(
    appEnvironment: AppEnvironment.PROD,
    appName: "Otto International",
    baseUrl: "https://api.unsplash.com/",
    appLogo: AppImages.PROD_IMAGE,
    child: MyApp(),
  );
  runApp(appconfig);
}
