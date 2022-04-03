import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/constansts/setting_page/setting_page.dart';

import '../constansts/widget_const/widget_const.dart';
import '../controller/controller.dart';

class AddPhoneBlack extends StatelessWidget {
  bool userIcon;

  AddPhoneBlack({required this.userIcon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //AddPhoneCountry
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 6.w),
              child: Text(
                WidgetConst.phoneNumber,
                style: Controller.editBool != true
                    ? TextStyle(
                        color: SettingConst.settingPageGeneralBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp)
                    : TextStyle(
                        color: SettingConst.settingPageGeneralBlack,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
              ),
            ),
            SizedBox(
              width: 140.w,
              height: 48.h,
              child: CountryCodePicker(
                enabled: Controller.editBool!,
                boxDecoration: BoxDecoration(color: Colors.white),
                textStyle: SettingConst.textFieldHintStyle,
                initialSelection: "TR",
                showFlag: true,
              ),
            ),
            Container(
                width: 100.w,
                height: 1,
                decoration: const BoxDecoration(color: Colors.black)),
          ],
        ),

        //AddPhone
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 22.w),
            child: TextFormField(
              enabled: Controller.editBool,
              style: SettingConst.textFieldHintStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  userIcon == true ? FontAwesomeIcons.user : null,
                  color: Colors.black,
                ),
                suffixIconColor: Colors.black,
                hintStyle: SettingConst.textFieldHintStyle,
                hintText: "555 555 5555",
                disabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
