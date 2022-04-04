import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/constansts/onboard_login_register/login_register.dart';
import 'package:untitled1/constansts/onboard_login_register/onboarding_screen.dart';
import 'package:untitled1/widgets/add_phone_widget.dart';
import 'package:untitled1/widgets/buttons/login_button.dart';
import 'package:untitled1/widgets/buttons/register_button.dart';
import 'package:untitled1/widgets/soru_sakla.dart';

import '../otp_verification_screen/otp_verification_screen.dart';
import '../register_screen/register_screen.dart';

class LoginRegisterScreen extends StatelessWidget {
  LoginRegisterScreen({Key? key}) : super(key: key);
  List<DropdownMenuItem<Text>> itemList = [DropdownMenuItem(child: Text("1"))];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0.49999999999999994, -3.0616171314629196e-17),
                end: Alignment(0.49999999999999994, 0.9999999999999999),
                colors: [Color(0xff0fe3a7), Color(0xff00bada)])),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SoruSakla(),
            // No more paper receipt!
            Center(
              child: Text(LogRegConstants.subTitle,
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.sp),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 50.h,
            ),
            AddPhone(userIcon: true),
            SizedBox(
              height: 80.h,
            ),
            LoginButton(page: OtpVerificationPage()),
            SizedBox(height: 20.h),
            RegisterButton(
                page: RegisterScreen(),
                title: OnboardingScreenConstants.register)
          ],
        ),
      ),
    );
  }
}
