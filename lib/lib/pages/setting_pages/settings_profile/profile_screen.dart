import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:untitled1/constansts/icon_constants/icon_constants.dart';
import 'package:untitled1/constansts/onboard_login_register/register_page_constansts.dart';
import 'package:untitled1/constansts/setting_page/setting_page.dart';
import 'package:untitled1/widgets/add_phone_widget_black.dart';
import 'package:untitled1/widgets/app_bar_widget/app_bar_widget.dart';

import '../../../controller/controller.dart';
import '../../../widgets/buttons/setting_page_drop_down_seach.dart';
import '../../../widgets/setting_page_text_field_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DateTime now = DateTime.now();
  DateTime selectedDate = DateTime.now();
  DateTime firstYear = DateTime(1922);

  @override
  Widget build(BuildContext context) {
    Widget scaffold = Scaffold(
      body: Column(
        children: [
          MyAppBar(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Controller2.goBack(context);
                },
                icon: Image(
                  image: Svg(IconConst.settingsBackArrowIcon),
                ),
              ),
              Text(
                SettingConst.profile,
                style: TextStyle(color: Colors.black, fontSize: 18.75.sp),
              ),
              IconButton(
                onPressed: () {
                  setState(() {});
                  print(Controller.editBool);
                  Controller.editBool = !Controller.editBool!;
                },
                icon: Image(
                    image: Controller.editBool == true
                        ? Svg(IconConst.editFinishIcon)
                        : Svg(IconConst.editIcon)),
              ),
            ],
          )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 15),
              child: ListView(
                children: [
                  SettingScreenTextFieldWidget(
                    hintText: "Jimmy",
                    titleText: SettingConst.hintName,
                    editle: Controller.editBool,
                  ),
                  buildSizedBox(),
                  SettingScreenTextFieldWidget(
                    hintText: SettingConst.hintSurname,
                    titleText: "Grammy",
                    editle: Controller.editBool,
                  ),
                  buildSizedBox(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.h),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {
                        Controller.editBool == true
                            ? _selectDate(context)
                            : null;
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Text(SettingConst.birthDate,
                                style: Controller.editBool != true
                                    ? TextStyle(
                                        color:
                                            SettingConst.settingPageGeneralBlue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp)
                                    : TextStyle(
                                        color: SettingConst
                                            .settingPageGeneralBlack,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp),
                                textAlign: TextAlign.left),
                          ),
                          Text(
                            formatDate(
                                DateTime(selectedDate.year, selectedDate.month,
                                    selectedDate.day),
                                [dd, '/', mm, '/', yyyy]),
                            style: SettingConst.textFieldHintStyleDisable,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            height: 1,
                            width: double.infinity,
                            color: Colors.black,
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
                          padding:
                              RegisterPageConstansts.dropDrownButtonLeftPadding,
                          child: SettingDropdownSearchWidget(
                              labelText: SettingConst.exam,
                              hintText: SettingConst.defaultSelectedExam,
                              callBackMyValue: (value) {
                                SettingConst.selectedExam = value!;
                              },
                              items: getItems(),
                              selectedItem: SettingConst.selectedExam),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: RegisterPageConstansts
                              .dropDrownButtonRightPadding,
                          child: SettingDropdownSearchWidget(
                              labelText: SettingConst.study,
                              hintText: SettingConst.defaultSelectedStudy,
                              callBackMyValue: (value) {
                                SettingConst.selectedStudy = value!;
                              },
                              items: getItems(),
                              selectedItem: SettingConst.selectedStudy),
                        ),
                      ),
                    ],
                  ),
                  buildSizedBox(),
                  AddPhoneBlack(userIcon: false),
                  buildSizedBox(),
                  SettingScreenTextFieldWidget(
                    hintText: SettingConst.hintEmailAddress,
                    titleText: "jimmygrammy@gmail.com",
                    editle: Controller.editBool,
                  ),
                  buildSizedBox(),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              RegisterPageConstansts.dropDrownButtonLeftPadding,
                          child: SettingDropdownSearchWidget(
                              labelText: SettingConst.city,
                              hintText: SettingConst.selectedCity,
                              callBackMyValue: (value) {
                                SettingConst.selectedCity = value!;
                              },
                              items: getItems(),
                              selectedItem: SettingConst.selectedCity),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: RegisterPageConstansts
                              .dropDrownButtonRightPadding,
                          child: SettingDropdownSearchWidget(
                              labelText: SettingConst.district,
                              hintText: SettingConst.defaultSelectedDistrict,
                              callBackMyValue: (value) {
                                SettingConst.selectedDistrict = value!;
                              },
                              items: getItems(),
                              selectedItem: SettingConst.selectedDistrict),
                        ),
                      ),
                    ],
                  ),
                  buildSizedBox(),
                  Padding(
                    padding: RegisterPageConstansts.dropDrownButtonSoloPadding,
                    child: SettingDropdownSearchWidget(
                        labelText: SettingConst.highSchool,
                        hintText: SettingConst.defaultSelectedHighScool,
                        callBackMyValue: (value) {
                          SettingConst.selectedHighScool = value!;
                        },
                        items: getItems(),
                        selectedItem: SettingConst.selectedHighScool),
                  ),
                  buildSizedBox(),
                  Padding(
                    padding: RegisterPageConstansts.dropDrownButtonSoloPadding,
                    child: SettingDropdownSearchWidget(
                        labelText: SettingConst.classs,
                        hintText: SettingConst.defaultSelectedClass,
                        callBackMyValue: (value) {
                          SettingConst.selectedClass = value!;
                        },
                        items: getItems(),
                        selectedItem: SettingConst.selectedClass),
                  ),
                  buildSizedBox(),
                  SettingScreenTextFieldWidget(
                    hintText: SettingConst.hintCourseCenter,
                    titleText: SettingConst.courseCenter,
                    editle: Controller.editBool,
                  ),
                  buildSizedBox(),
                  Controller.editBool == false
                      ? buildSizedBox()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 52.h),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 20.w),
                                primary: Color.fromRGBO(63, 244, 193, 1),
                                textStyle: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              setState(() {
                                Controller.editBool = false;
                              });
                            },
                            child: Text(
                              SettingConst.saveChanges,
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Color.fromRGBO(5, 129, 94, 1),
                              ),
                            ),
                          ),
                        ),
                  buildSizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    scaffold = Theme(
      data: ThemeData(
        textTheme: TextTheme(
          subtitle1: SettingConst.textFieldHintStyle,
          subtitle2: SettingConst.textFieldHintStyle,
        ),
      ),
      child: scaffold,
    );

    return SafeArea(child: scaffold);
  }

  SizedBox buildSizedBox() => SizedBox(height: 24.h);

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

  List<String> getItems() {
    return [
      "Brazil",
      "asdasd",
      'qweqwe',
      "asdasd",
      "Tunisia",
    ];
  }
}
