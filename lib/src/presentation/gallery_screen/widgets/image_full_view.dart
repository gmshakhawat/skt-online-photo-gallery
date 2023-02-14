import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:skt_photo_gallery/src/constents/skt_colors.dart';
import 'package:skt_photo_gallery/src/constents/skt_strings.dart';
import 'package:skt_photo_gallery/src/models/photo_model.dart';
import 'package:skt_photo_gallery/src/presentation/gallery_screen/widgets/skt_newtwork_image_view.dart';
import 'package:skt_photo_gallery/src/widgets/skt_text.dart';
import 'package:toast/toast.dart';

imageFullView(context, PhotoModel photo, {required Function onSwap}) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      pageBuilder: (_, __, ___) {
        return SizedBox.expand(
          child: GestureDetector(
            onHorizontalDragEnd: (dragDetail) {
              double position = dragDetail.velocity.pixelsPerSecond.dx;
              if (position != 0) {
                //when not zooming
                if (position < 1) {
                  //right
                  onSwap(1);
                } else {
                  //left
                  onSwap(-1);
                }
              }
            },
            child: Container(
              color: HexColor.fromHex(photo.color),
              padding: const EdgeInsets.all(15),
              child: Stack(
                children: [
                  InteractiveViewer(
                    minScale: 0.1,
                    maxScale: 5,
                    child: Card(
                      margin: const EdgeInsets.only(top: 30, bottom: 5),
                      elevation: 10,
                      color: HexColor.fromHex(photo.color),
                      shadowColor: HexColor.fromHex(photo.color),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: SktNetworkImageView(
                            blurHashCode: photo.blurHash,
                            image: photo.urls!.regular),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 50, left: 20),
                    height: 30,
                    width: 100,
                    padding: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(10)),
                    // color: HexColor.fromHex(photo.color).withGreen(50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: SktText(
                            photo.likes,
                            fontWeight: FontWeight.bold,
                            color: SktColors.appColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.favorite_outline_rounded,
                          color: SktColors.appColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _downloadImage(photo.links!.download);
                          },
                          child: const Icon(
                            Icons.download,
                            color: SktColors.appColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        height: 30,
                        width: 30,

                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(top: 50, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(30)),
                        // height: 1,
                        child: const Icon(
                          Icons.cancel,
                          size: 30,
                          color: SktColors.appColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

void _downloadImage(url) async {
  try {
    // Saved with this method.
    Toast.show(SktStrings.downloadStarted,
        duration: Toast.lengthLong, gravity: Toast.bottom);

    ImageDownloader.downloadImage(url).then((imageId) {
      Toast.show(SktStrings.downloadFinished,
          duration: Toast.lengthLong, gravity: Toast.bottom);
      if (imageId == null) return;
    });
  } on PlatformException catch (error) {
    print(error);
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
