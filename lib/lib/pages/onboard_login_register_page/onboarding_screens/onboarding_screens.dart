import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:untitled1/pages/onboard_login_register_page/login_register_screen/login_register_screen.dart';
import 'package:untitled1/widgets/buttons/login_button.dart';

import '../../../constansts/onboard_login_register/onboarding_screen.dart';
import '../../../widgets/buttons/register_button.dart';
import '../register_screen/register_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin:
                      Alignment(0.49999999999999994, -3.0616171314629196e-17),
                  end: Alignment(0.49999999999999994, 0.9999999999999999),
                  colors: [Color(0xff0fe3a7), Color(0xff00bada)])),
          child: Column(
            children: [
              SizedBox(
                height: 108.h,
              ),
              Expanded(
                child: buildIntroductionScreen(),
              ), //Material App

              // Get Started Button
              RegisterButton(
                  page: RegisterScreen(),
                  title: OnboardingScreenConstants.register),
              // Rectangle 2

              SizedBox(
                height: 13.h,
              ),
              LoginButton(page: LoginRegisterScreen()),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IntroductionScreen buildIntroductionScreen() {
    return IntroductionScreen(
      dotsDecorator: DotsDecorator(
        activeColor: Colors.white,
        color: const Color(0xffffffff).withOpacity(0.30000001192092896),
        size: const Size(10.0, 10.0),
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      globalBackgroundColor: Colors.transparent,
      pages: list(),
      showBackButton: false,
      showDoneButton: false,
      showNextButton: false,
      showSkipButton: false,
    );
  }

  List<PageViewModel> list() {
    return [
      PageViewModel(
        titleWidget: const SizedBox(),
        bodyWidget: Stack(alignment: Alignment.topRight, children: [
          Text(OnboardingScreenConstants.title1,
              style: TextStyle(
                color: const Color(0xffffffff),
                fontSize: 38.sp,
              ),
              textAlign: TextAlign.center),
          PositionedDirectional(
              end: 10.w,
              top: 5.h,
              child: Image.asset("assets/images/icons/handshake.png")),
        ]),
        image: Image.asset("assets/images/icons/onboard_icon1.png"),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Colors.orange),
          bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        ),
      ),
      buildpageViewModel(OnboardingScreenConstants.title2,
          "assets/images/icons/onboard_icon2.png"),
      buildpageViewModel(OnboardingScreenConstants.title3,
          "assets/images/icons/onboard_icon3.png"),
    ];
  }

  PageViewModel buildpageViewModel(String? title, String? imagePath) {
    return PageViewModel(
      titleWidget: const SizedBox(),
      bodyWidget: Text(title!,
          style: TextStyle(
            color: const Color(0xffffffff),
            fontSize: 38.sp,
          ),
          textAlign: TextAlign.center),
      image: Image.asset(imagePath!),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Colors.orange),
        bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ),
    );
  }
}
