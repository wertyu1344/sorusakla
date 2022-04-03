import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constansts/setting_page/setting_page.dart';
import '../../controller/controller.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                width: 375.w,
                height: 72.w,
                child: Row(children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10.0.w, right: 80.5.w),
                      child: InkWell(
                        onTap: () => Controller2.goBack(context),
                        child: const Image(
                          width: 32,
                          height: 32,
                          image: Svg(
                              'assets/images/icons/settings_icons/back_arrow.svg'),
                        ),
                      )),
                  Text(
                    SettingConst.premiumMembership,
                    style: GoogleFonts.roboto(
                      color: const Color(0xff272643),
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  )
                ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 21.h,
                  ),
                  Container(
                    width: 340.w,
                    height: 107.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            offset: Offset(0, 7),
                            color: Color(0x400fe2a8))
                      ],
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 15, 227, 167),
                        Color.fromARGB(255, 0, 186, 218),
                      ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 16.79.w, top: 10.5.h, right: 12.w),
                              child: Image(
                                width: 44.w,
                                height: 44.w,
                                image: const Svg(
                                    'assets/images/icons/settings_icons/buy.svg'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22.0.h),
                              child: Text(
                                SettingConst.extendPeriod,
                                style: GoogleFonts.roboto(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.5),
                          child: Container(
                            alignment: Alignment.center,
                            width: 149,
                            height: 32,
                            decoration: BoxDecoration(
                                color: Color(0x80ffffff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text(SettingConst.renewPackage,
                                style: GoogleFonts.roboto(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 45.h),
                  infoGroup("${SettingConst.packageInfo}:",
                      SettingConst.basicPackage),
                  SizedBox(height: 17.h),
                  infoGroup("${SettingConst.packageName}:",
                      SettingConst.basicPackage),
                  SizedBox(height: 17.h),
                  infoGroup("${SettingConst.packageDescription}:",
                      SettingConst.basicPackage),
                  SizedBox(height: 17.h),
                  infoGroup("${SettingConst.packagePrice}:", "\$19"),
                  SizedBox(height: 17.h),
                  infoGroup(
                      "${SettingConst.packageExpiryDate}:", "Feb 28, 2021"),
                  SizedBox(height: 17.h),
                  infoGroup("${SettingConst.purchaseDate}:", "Feb 01, 2021"),
                  SizedBox(height: 17.h),
                  infoGroup("${SettingConst.purchaseLimit}:",
                      "120 ${SettingConst.photo}"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Column infoGroup(String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1,
            style: GoogleFonts.roboto(
                color: const Color(0xff8b8b8b),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12.0.sp),
            textAlign: TextAlign.left),
        SizedBox(
          height: 2.h,
        ),
        Text(text2,
            style: GoogleFonts.roboto(
                color: const Color(0xff004958),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 16.0.sp),
            textAlign: TextAlign.left)
      ],
    );
  }
}
