import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

TextStyle headingStyle(BuildContext context) {
  // double screenWidth = MediaQuery.of(context).size.width;
  return GoogleFonts.kanit(
      fontWeight: FontWeight.w500, fontSize: 20.sp, color: Colors.white);
}

TextStyle titleStyle(BuildContext context) {
  return GoogleFonts.lora(
      fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black);
}

TextStyle subtitleStyle(BuildContext context) {
  return GoogleFonts.kanit(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
}

EdgeInsetsGeometry kPagePadding = const EdgeInsets.symmetric(horizontal: 20);
