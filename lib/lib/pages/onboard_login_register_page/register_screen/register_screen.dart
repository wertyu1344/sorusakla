import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/constansts/onboard_login_register/onboarding_screen.dart';
import 'package:untitled1/widgets/add_phone_widget.dart';
import 'package:untitled1/widgets/buttons/login_button.dart';
import 'package:untitled1/widgets/buttons/register_button.dart';

import '../../../constansts/onboard_login_register/register_page_constansts.dart';
import '../../../widgets/buttons/register_page_dropdrown_search.dart';
import '../../../widgets/register_page_text_form_fields.dart';
import '../../../widgets/soru_sakla.dart';
import '../login_register_screen/login_register_screen.dart';
import '../otp_verification_screen/otp_verification_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final _dropDownKey = GlobalKey<DropdownSearchState>();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _dateController = TextEditingController();

  DateTime now = DateTime.now();
  DateTime selectedDate = DateTime.now();
  DateTime firstYear = DateTime(1922);
  String selectedExam = "TYT-AYT";
  String selectedStudy = "Science";
  String selectedCity = "Istanbul";
  String selectedDistrict = "Maltepe";
  String selectedHighScool = "Istanbul High School";
  String selectedClass = "Class-9";
  String selectedDropDownSearchItem = "Brazil";
  String selectedCourseCenter = "Istabul...";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: OnboardingScreenConstants.backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            SizedBox(height: 63.h),
            const SoruSakla(),
            buildSizedBox(),
            MyTextFieldWidget(
                hintText: RegisterPageConstansts.name,
                titleText: RegisterPageConstansts.name),
            buildSizedBox(),
            MyTextFieldWidget(
                hintText: RegisterPageConstansts.birthDate,
                titleText: RegisterPageConstansts.birthDate),
            buildSizedBox(),
            //Date Pick
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    foregroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent)),
                onPressed: () {
                  _selectDate(context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Text("${RegisterPageConstansts.birthDate}*",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0.sp),
                          textAlign: TextAlign.left),
                    ),
                    Text(
                      formatDate(
                          DateTime(selectedDate.year, selectedDate.month,
                              selectedDate.day),
                          [dd, '/', mm, '/', yyyy]),
                      style: RegisterPageConstansts.textFieldHintStyle,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.h),
                      height: 1,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            buildSizedBox(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: RegisterPageConstansts.dropDrownButtonLeftPadding,
                    child: RegisterDropdownSearchWidget(
                        labelText: RegisterPageConstansts.exam,
                        hintText: "TYT-AYT",
                        callBackMyValue: (value) {
                          selectedExam = value!;
                        },
                        items: getItems(),
                        selectedItem: selectedExam),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: RegisterPageConstansts.dropDrownButtonRightPadding,
                    child: RegisterDropdownSearchWidget(
                        labelText: RegisterPageConstansts.study,
                        hintText: selectedStudy,
                        callBackMyValue: (value) {
                          selectedStudy = value!;
                        },
                        items: getItems(),
                        selectedItem: selectedStudy),
                  ),
                ),
              ],
            ),
            AddPhone(userIcon: false),
            buildSizedBox(),
            MyTextFieldWidget(
                hintText: "jimmygrammy@gmail.com",
                titleText: "${RegisterPageConstansts.emailAddress}*"),
            buildSizedBox(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: RegisterPageConstansts.dropDrownButtonLeftPadding,
                    child: RegisterDropdownSearchWidget(
                        labelText: RegisterPageConstansts.city,
                        hintText: "İstanbul",
                        callBackMyValue: (value) {
                          selectedCity = value!;
                        },
                        items: getItems(),
                        selectedItem: selectedCity),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: RegisterPageConstansts.dropDrownButtonRightPadding,
                    child: RegisterDropdownSearchWidget(
                        labelText: RegisterPageConstansts.district,
                        hintText: selectedDistrict,
                        callBackMyValue: (value) {
                          selectedDistrict = value!;
                        },
                        items: getItems(),
                        selectedItem: selectedDistrict),
                  ),
                ),
              ],
            ),
            buildSizedBox(),
            Padding(
              padding: RegisterPageConstansts.dropDrownButtonSoloPadding,
              child: RegisterDropdownSearchWidget(
                  labelText: RegisterPageConstansts.highSchool,
                  hintText: selectedHighScool,
                  callBackMyValue: (value) {
                    selectedHighScool = value!;
                  },
                  items: getItems(),
                  selectedItem: selectedHighScool),
            ),
            buildSizedBox(),
            Padding(
              padding: RegisterPageConstansts.dropDrownButtonSoloPadding,
              child: RegisterDropdownSearchWidget(
                  labelText: RegisterPageConstansts.classs,
                  hintText: selectedClass,
                  callBackMyValue: (value) {
                    selectedClass = value!;
                  },
                  items: getItems(),
                  selectedItem: selectedClass),
            ),
            buildSizedBox(),
            Padding(
              padding: RegisterPageConstansts.dropDrownButtonSoloPadding,
              child: RegisterDropdownSearchWidget(
                  labelText: RegisterPageConstansts.courseCenter,
                  hintText: selectedCourseCenter,
                  callBackMyValue: (value) {
                    selectedCourseCenter = value!;
                  },
                  items: getItems(),
                  selectedItem: selectedCourseCenter),
            ),
            buildSizedBox(),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: RegisterButton(
                  title: RegisterPageConstansts.continueString,
                  page: const OtpVerificationPage()),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 10.h, bottom: 50.h),
              child: LoginButton(page: LoginRegisterScreen()),
            ),
            buildSizedBox()
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => SizedBox(height: 24.h);

  List<String> getItems() {
    return [
      "Brazil",
      "Italia (Disabled)",
      "asdasd",
      'qweqwe',
      "zxczxc",
      "asdasd",
      "Tunidfgdfsia",
      "Tunisia",
      "Tunisia",
      "Tunisia",
      "Tunisia",
      "Tunisia",
      "Tunisia",
      "Tunisia",
      "Tunisia",
      "Tunisia",
      "Tunisia",
      "Tunisia"
    ];
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstYear,
        lastDate: now);
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
