import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../constansts/widget_const/widget_const.dart';

class PinputWidget extends StatelessWidget {
  const PinputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = PinTheme(
      width: 64.w,
      height: 62.h,
      textStyle: TextStyle(
          fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final defaultPinTheme = PinTheme(
      width: 80.w,
      height: 80.h,
      textStyle: TextStyle(
          fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    return Pinput(
      disabledPinTheme: focusedPinTheme,
      defaultPinTheme: defaultPinTheme,
      validator: (s) {
        return s == '2222' ? null : WidgetConst.pinIsIncorrect;
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) {},
    );
  }
}
