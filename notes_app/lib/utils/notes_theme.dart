import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesTheme {
  static const Color backgroundColor = Color(0xff000000);
  static const Color highlightColor = Color(0xffD1AA24);
  static const Color whiteColor = Color(0xffffffff);
  static const Color slightBlack = Color(0xff1C1C1E);

  static TextStyle appText({
    required double size,
    required FontWeight weight,
    FontStyle style = FontStyle.normal,
    Color color = whiteColor,
    double letterSpacing = -1,
    bool isShadow = false,
  }) {
    return GoogleFonts.dmSans(
        fontSize: size,
        fontWeight: weight,
        wordSpacing: 1.4,
        fontStyle: style,
        letterSpacing: letterSpacing,
        color: color,
        shadows: isShadow
            ? [
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0.1, 0.4),
                    spreadRadius: 3,
                    blurRadius: 2)
              ]
            : null);
  }

  static InputDecoration waInputDecoration(
      {IconData? prefixIcon,
      String? hint,
      Color? bgColor,
      double fontSize = 20,
      Color? borderColor,
      EdgeInsets? padding}) {
    return InputDecoration(
      contentPadding:
          padding ?? const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      counter: const Offstage(),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: highlightColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: Colors.redAccent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(color: borderColor ?? highlightColor)),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide: BorderSide(color: Colors.grey),
      ),
      fillColor: bgColor ?? Colors.grey.withOpacity(0.04),
      hintText: hint,
      prefixIcon:
          prefixIcon != null ? Icon(prefixIcon, color: highlightColor) : null,
      hintStyle: appText(
          size: fontSize, weight: FontWeight.normal, color: Colors.grey),
      filled: true,
    );
  }

  static ButtonStyle buttonStyle(
      {double fontSize = 10,
      FontWeight weight = FontWeight.bold,
      Color fontColor = Colors.white,
      required Color backColor,
      Color borderColor = Colors.transparent}) {
    return ElevatedButton.styleFrom(
        textStyle: appText(size: fontSize, weight: weight, color: fontColor),
        backgroundColor: backColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: BorderSide(color: borderColor)));
  }
}
