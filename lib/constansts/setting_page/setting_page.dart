import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingConst {
  //Profile Screen

  static String profile = "Profile";
  static String hintName = "Name";
  static String hintSurname = "Surname";
  static String birthDate = "Birth Date";
  static String exam = "Exam";
  static String study = "Study";
  static String hintEmailAddress = "Email Address";
  static String city = "City";
  static String district = "District";
  static String highSchool = "High School";
  static String classs = "Class";
  static String hintCourseCenter = "Istanbul Course Center";
  static String courseCenter = "Course Center";
  static String saveChanges = "Save Changes";

  static String defaultSelectedExam = "TYT-AYT";
  static String defaultSelectedStudy = "Science";
  static String defaultSelectedCity = "İstanbul";
  static String defaultSelectedDistrict = "Maltepe";
  static String defaultSelectedHighScool = "istanbul High School";
  static String defaultSelectedClass = "Class-9";
  static String defaultSelectedDropDownSearchItem = "Brazil";
  static String defaultSelectedCourseCenter = "Instabul...";

  static String selectedExam = "TYT-AYT";
  static String selectedStudy = "Science";
  static String selectedCity = "Istanbul";
  static String selectedDistrict = "Maltepe";
  static String selectedHighScool = "Istanbul High School";
  static String selectedClass = "Class-9";
  static String selectedDropDownSearchItem = "Brazil";
  static String selectedCourseCenter = "Istanbul...";

  static Color settingPageGeneralBlue = Color.fromARGB(255, 4, 198, 203);
  static Color settingPageGeneralBlack = Color.fromARGB(255, 0, 73, 88);

  static TextStyle textFieldLabelStyleDisable = TextStyle(
    color: const Color.fromARGB(255, 4, 198, 203),
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textFieldHintStyleDisable = TextStyle(
      color: Color.fromARGB(255, 0, 73, 88),
      fontWeight: FontWeight.w200,
      fontSize: 18.sp);
  static TextStyle textFieldLabelStyle = TextStyle(
      color: Color.fromARGB(255, 0, 73, 88),
      fontSize: 16.sp,
      fontWeight: FontWeight.w400);
  static TextStyle textFieldHintStyle = TextStyle(
      color: Color.fromARGB(255, 0, 73, 88),
      fontSize: 18.sp,
      fontWeight: FontWeight.w400);

  //Membership Expire
  static String premiumMembership = "Premium membership";
  static String extendPeriod = "Extend the subscription period";
  static String buyPackage = "Buy Package";
  static String packageInfo = "Package Information";
  static String packageName = "Package Name";
  static String packageDescription = "Package Description";
  static String packagePrice = "Package Price";
  static String packageExpiryDate = "Package Expiry Date";
  static String purchaseDate = "Purchase Date";
  static String purchaseLimit = "Purchase Limit";
  static String freePackage = "Free Package";
  static String photo = "photo";
  static String renewPackage = "Renew Package";
  static String basicPackage = "Basic Package";

  //Setting Screen
  static String useLocalStorage = "Use Local Storage";
  static String useLocalStorageSub =
      "you can use the application without internet";
  static String showDefaultTags = "Show Defult Tags";
  static String showDefaultTagsSub =
      "Course and subject tags are automatically imported";
  static String selectLanguage = "Select Language";
  static String english = "English";
  static String logout = "Logout";
}
