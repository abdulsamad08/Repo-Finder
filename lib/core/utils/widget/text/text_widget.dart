import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transviti_test/core/constants/app_colors.dart';

Widget text({
  required BuildContext context,
  required String text,
  TextOverflow overflow = TextOverflow.visible,
  double fontSize = 12,
  int? maxLines,
  TextAlign textAlign = TextAlign.start,
  FontWeight fontWeight = FontWeight.normal,
  double? lineheight,
}) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  Color textColor = isDarkMode ? AppColors.background : Colors.black;

  return AutoSizeText(
    text,
    overflow: overflow,
    textAlign: textAlign,
    maxLines: maxLines ?? 10,
    presetFontSizes: [fontSize, fontSize - 2, fontSize - 3, fontSize - 4],
    style: GoogleFonts.nunitoSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: lineheight ?? 1.4,
      color: textColor,
    ),
  );
}
