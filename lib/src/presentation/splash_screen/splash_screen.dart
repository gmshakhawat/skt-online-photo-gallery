import 'package:flutter/material.dart';
import 'package:skt_photo_gallery/src/constents/skt_colors.dart';
import 'package:skt_photo_gallery/src/constents/skt_paths.dart';
import 'package:skt_photo_gallery/src/constents/skt_strings.dart';
import 'package:skt_photo_gallery/src/utils/custom_loader_logo.dart';

import 'package:skt_photo_gallery/src/widgets/skt_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(
            context, SktPaths.gellaryPath, (route) => false));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(
            height: 20,
          ),
          SktCustomLoaderLogo(),
        ],
      ),
    );
  }
}
