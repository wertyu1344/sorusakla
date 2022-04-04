import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constansts/icon_constants/icon_constants.dart';
import '../constansts/onboard_login_register/login_register.dart';

class SoruSakla extends StatelessWidget {
  const SoruSakla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(IconConst.sIcon),
        Text(LogRegConstants.oruSakla,
            style: TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
                fontSize: 60.sp),
            textAlign: TextAlign.center),
      ],
    );
  }
}
