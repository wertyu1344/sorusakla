import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPdfConstanst {
  static var buttonTitleTextStyleBold = GoogleFonts.inter(
      color: const Color.fromRGBO(9, 44, 76, 1),
      fontWeight: FontWeight.w700,
      fontSize: 18.sp);
  static var buttonTitleTextStyle = GoogleFonts.inter(
      color: const Color.fromRGBO(9, 44, 76, 1),
      fontWeight: FontWeight.w700,
      fontSize: 11.sp);
  static var buttonTextStyle = TextStyle(
      color: const Color.fromRGBO(126, 146, 162, 1),
      fontWeight: FontWeight.w400,
      fontSize: 12.sp);
  static var filterButtonStyle = ElevatedButton.styleFrom(
      primary: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), side: BorderSide.none),
      side: BorderSide.none,
      shadowColor: Colors.transparent);
  static var dateButtonuttonStyle = ElevatedButton.styleFrom(
      primary: const Color.fromRGBO(234, 238, 244, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      shadowColor: Colors.transparent);
}
