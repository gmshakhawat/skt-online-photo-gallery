import 'package:flutter/material.dart';
import 'package:skt_photo_gallery/src/presentation/gallery_screen/gallery_screen_builder.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GalleryScreenBuilder(),
    );
  }
}
