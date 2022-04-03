import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/controller.dart';
import '../gradient_text.dart';

class RegisterButton extends StatelessWidget {
  final Widget page;
  final String title;

  const RegisterButton({required this.page, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Controller2.routeTo(page, context);
      },
      child: Container(
          alignment: Alignment.center,
          child: GradientText(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 20.sp),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 15, 227, 167),
              Color.fromARGB(255, 0, 186, 218),
            ]),
          ),
          width: 321.w,
          height: 55.h,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Color(0xffffffff))),
    );
  }
}
