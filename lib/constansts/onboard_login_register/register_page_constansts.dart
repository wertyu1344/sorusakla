import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPageConstansts {
  static String continueString = "Continue";

  static TextStyle textFieldLabelStyle =
      TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16.sp);
  static TextStyle textFieldHintStyle =
      TextStyle(color: Colors.white, fontSize: 18.sp, fontFamily: "Avenir");

  static EdgeInsets dropDrownButtonSoloPadding =
      EdgeInsets.symmetric(horizontal: 22.h);
  static EdgeInsets dropDrownButtonLeftPadding =
      EdgeInsets.only(left: 22.w, right: 11.h);
  static EdgeInsets dropDrownButtonRightPadding =
      EdgeInsets.only(left: 11.h, right: 22.h);

  //Strings

  static String name = "Name";
  static String birthDate = "Birth Date";
  static String exam = "Exam";
  static String study = "Study";
  static String emailAddress = "Email Address";
  static String city = "City";
  static String district = "District";
  static String highSchool = "High School";
  static String classs = "Class";
  static String courseCenter = "Course Center";
}
