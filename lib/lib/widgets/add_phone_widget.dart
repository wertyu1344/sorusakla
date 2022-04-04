import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constansts/widget_const/widget_const.dart';

class AddPhone extends StatelessWidget {
  bool userIcon;
  AddPhone({required this.userIcon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //AddPhoneCountry
        Column(
          children: [
            Opacity(
              opacity: 0.800000011920929,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Text(WidgetConst.phoneNumber,
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0.sp),
                    textAlign: TextAlign.left),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 140.w,
                  height: 60.h,
                  child: CountryCodePicker(
                    boxDecoration: const BoxDecoration(
                        color: Color.fromARGB(255, 243, 247, 253)),
                    textStyle:
                        const TextStyle(fontSize: 14, color: Colors.white),
                    initialSelection: "TR",
                    showFlag: true,
                  ),
                ),
              ],
            ),
            Container(
                width: 100.w,
                height: 1,
                decoration: const BoxDecoration(color: Color(0xffffffff))),
          ],
        ),

        //AddPhone
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 20.w),
            child: SizedBox(
                width: 220.w,
                child: TextFormField(
                  style: TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.sp),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      userIcon == true ? FontAwesomeIcons.user : null,
                      color: Colors.white,
                    ),
                    suffixIconColor: Colors.white,
                    hintStyle: TextStyle(
                        color: const Color(0xffffffff).withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0.sp),
                    hintText: WidgetConst.enterPhoneNumber,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
