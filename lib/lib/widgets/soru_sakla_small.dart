import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constansts/icon_constants/icon_constants.dart';
import '../constansts/onboard_login_register/login_register.dart';
import 'gradient_text.dart';

class SoruSaklaSmall extends StatelessWidget {
  const SoruSaklaSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Row(
        children: [
          Image.asset(IconConst.smallSIcon),
          GradientText(
            LogRegConstants.oruSakla,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 1.sp),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 15, 227, 167),
              Color.fromARGB(255, 0, 186, 218),
            ]),
          ),
        ],
      ),
    );
  }
}
