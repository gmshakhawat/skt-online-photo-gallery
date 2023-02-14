
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skt_photo_gallery/src/constents/skt_colors.dart';

class SktText extends StatelessWidget {
  final dynamic text;
  final Color color;
  final double fsize, letterSpace;
  final TextAlign textAlign;
  final int maxLines;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextOverflow textOverflow;

  const SktText(this.text,
      {Key? key,
      this.textAlign = TextAlign.start,
      this.color = SktColors.text,
      this.fsize = 13,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.textOverflow = TextOverflow.visible,
      this.letterSpace = 0,
      this.maxLines = 999})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text.toString(),
      overflow: this.textOverflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: GoogleFonts.delius(
          decoration: TextDecoration.none,
          fontStyle: this.fontStyle,
          fontSize: this.fsize,
          color: this.color,
          letterSpacing: letterSpace,
          fontWeight: this.fontWeight),
    );
  }
}
