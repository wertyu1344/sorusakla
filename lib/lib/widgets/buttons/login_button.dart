import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constansts/onboard_login_register/onboarding_screen.dart';
import '../../controller/controller.dart';

class LoginButton extends StatelessWidget {
  final Widget page;

  const LoginButton({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Controller2.routeTo(page, context);
      },
      child: Container(
          alignment: Alignment.center,
          child: // Login
              Text(
            OnboardingScreenConstants.login,
            style: TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 20.0.sp),
          ),
          width: 321.w,
          height: 55.h,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: const Color(0xffffffff), width: 1))),
    );
  }
}
