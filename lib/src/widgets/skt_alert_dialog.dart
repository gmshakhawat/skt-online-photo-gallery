import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skt_photo_gallery/main.dart';
import 'package:skt_photo_gallery/src/constents/skt_colors.dart';
import 'package:skt_photo_gallery/src/widgets/skt_text.dart';

sktAlertDialog(message,
    {cancelText,
    confirmText,
    Function? onConfirm,
    Function? onCancel,
    textAlign,
    isCancelable = true,
    confirmColor}) {
  return showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => WillPopScope(
            onWillPop: null,
            child: CupertinoAlertDialog(

                // title: Text("e-KYC"),
                title:
                    // Icon(Icons.error,size: 40,),

                    const SktText(
                  "Aleart!!!",
                  fsize: 20,
                  textAlign: TextAlign.center,
                ),
                content: SktText(
                  message.toString(),
                  fsize: 14,
                  textAlign: textAlign ?? TextAlign.center,
                ),
                actions: <Widget>[
                  if (isCancelable)
                    CupertinoDialogAction(
                        isDefaultAction: true,
                        isDestructiveAction: true,
                        textStyle: const TextStyle(fontSize: 20),
                        onPressed: () {
                          if (onCancel != null) {
                            onCancel();
                          } else {
                            Navigator.of(context).pop(false);
                          }
                        },
                        child: SktText(
                          cancelText != null ? cancelText : "OK",
                          color: SktColors.appColor,
                          fontWeight: FontWeight.bold,
                        )),
                  if (onConfirm != null)
                    CupertinoDialogAction(
                        isDefaultAction: true,
                        isDestructiveAction: true,
                        textStyle: TextStyle(fontSize: 20),
                        onPressed: () {
                          onConfirm();
                        },
                        child: SktText(
                          confirmText != null ? confirmText : "OK",
                          color: confirmColor ?? SktColors.text2,
                          fontWeight: FontWeight.bold,
                        )),
                ]),
          ));
}
