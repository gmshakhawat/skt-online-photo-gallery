import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skt_photo_gallery/src/constents/skt_paths.dart';
import 'package:skt_photo_gallery/src/presentation/gallery_screen/galllery_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {


      case SktPaths.gellaryPath:
        return CupertinoPageRoute(
            fullscreenDialog: true, builder: (context) => GalleryScreen());

      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
