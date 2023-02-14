import 'package:flutter/material.dart';
import 'package:skt_photo_gallery/app_config.dart';
import 'package:skt_photo_gallery/main.dart';
import 'package:skt_photo_gallery/src/constents/app_images.dart';
import 'package:skt_photo_gallery/src/dependency_injection/injector.dart';

void main() async {
  Injector.setup();
  var appconfig = AppConfig(
    appEnvironment: AppEnvironment.DEV,
    appName: "Otto International Dev",
    baseUrl: "https://api.unsplash.com/",
    appLogo: AppImages.DEV_IMAGE,
    child: MyApp(),
  );
  runApp(appconfig);
}
