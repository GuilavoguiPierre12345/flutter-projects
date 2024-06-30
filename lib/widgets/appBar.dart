import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telico_flutter/utils/global_variables.dart';

AppBar customAppBar({String? title, bool isTitleCenter = false}) {
  return AppBar(
    backgroundColor: themeColor,
    centerTitle: isTitleCenter,
    title: Text(
      title!,
      style: GoogleFonts.prompt(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
    ),
  );
}
