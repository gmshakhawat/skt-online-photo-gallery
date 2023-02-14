import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:skt_photo_gallery/src/constents/skt_colors.dart';
import 'package:skt_photo_gallery/src/utils/testing.dart';

class SktNetworkImageView extends StatelessWidget {
  final image;
  final blurHashCode;
  const SktNetworkImageView({
    Key? key,
    required this.image,
    required this.blurHashCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sktPrint("REbuilding=>$image");
    // final size = MediaQuery.of(context).size;
    return image != null
        ? Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: SktColors.appThemeBGColor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => blurHashCode != null
                    ? BlurHash(hash: blurHashCode)
                    : const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(
                  Icons.broken_image,
                  color: Colors.grey.withOpacity(0.5),
                  size: 80,
                ),
              ),
            ),
          )
        : Container(
            color: SktColors.boxColor,
            padding: EdgeInsets.all(15),
            child: Icon(Icons.error_outline_rounded),
          );
  }
}
