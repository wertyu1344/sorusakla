import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/constansts/onboard_login_register/onboarding_screen.dart';
import 'package:untitled1/constansts/onboard_login_register/otp_verification.dart';
import 'package:untitled1/pages/home_page/home_page/home_page.dart';
import 'package:untitled1/widgets/buttons/register_button.dart';
import 'package:untitled1/widgets/countdown.dart';
import 'package:untitled1/widgets/pinput/pinput.dart';

import '../../../controller/controller.dart';
import '../login_register_screen/login_register_screen.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: OnboardingScreenConstants.backgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Controller2.routeTo(LoginRegisterScreen(), context);
                        },
                      ),
                      Text(OtpConst.otpVerification,
                          style: TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0.sp),
                          textAlign: TextAlign.left),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 50.h),
                    child: Text(OtpConst.pleaseEnter,
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0.sp),
                        textAlign: TextAlign.left),
                  ),
                  // Code was sent to +90 507 123 45 67
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 5.h),
                    child: Opacity(
                      opacity: 0.800000011920929,
                      child: Text("${OtpConst.codeWasSenTo} +90 507 123 45 67",
                          style: TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0.sp),
                          textAlign: TextAlign.left),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 5.h),
                    child: Row(
                      children: [
                        Opacity(
                          opacity: 0.800000011920929,
                          child: Text(OtpConst.thisCodeWillBeExpireIn,
                              style: TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0.sp),
                              textAlign: TextAlign.left),
                        ),
                        CountdownWidget(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60.h),
              PinputWidget(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Didn’t receive an OTP?
                    Text(OtpConst.didntReceiveOtp,
                        style: TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0.sp),
                        textAlign: TextAlign.left),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.restart_alt_outlined,
                          color: Provider.of<Controller>(context, listen: true)
                                      .yourBoolVar ==
                                  (false)
                              ? Colors.white.withOpacity(0.8)
                              : Colors.white),
                      label: Text(OtpConst.resend,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color:
                                  Provider.of<Controller>(context, listen: true)
                                              .yourBoolVar ==
                                          (false)
                                      ? Colors.white.withOpacity(0.8)
                                      : Colors.white)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100.h),
              RegisterButton(page: HomePage(), title: OtpConst.verifCode),
            ],
          ),
        ),
      ),
    );
  }
}
