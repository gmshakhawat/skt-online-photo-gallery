import 'package:flutter/material.dart';
import 'package:skt_photo_gallery/src/constents/app_images.dart';
import 'package:skt_photo_gallery/src/constents/skt_colors.dart';

class SktCustomLoaderLogo extends StatefulWidget {
  const SktCustomLoaderLogo({Key? key}) : super(key: key);

  @override
  State<SktCustomLoaderLogo> createState() => _SktCustomLoaderLogoState();
}

class _SktCustomLoaderLogoState extends State<SktCustomLoaderLogo>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Size? _sSize;
  double? _boxSize, _pointSize;
  Animation<int>? _animation;
  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    _animation = IntTween(begin: 0, end: 4).animate(_animationController!);

    _animationController!.repeat();

    _animationController!.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: SktColors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Image.asset(AppImages.PROD_IMAGE)),
          ),
          Container(
            height: 120,
            width: 120,
            child: CircularProgressIndicator(
              color: SktColors.black,
            ),
          ),
        ],
      ),
    );
  }

  _box() {
    return Container(
      color: Colors.black,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _animationController!.dispose();

    super.dispose();
  }
}
