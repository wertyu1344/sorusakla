import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/constansts/onboard_login_register/register_page_constansts.dart';
import 'package:untitled1/controller/controller.dart';
import 'package:untitled1/pages/pdf_page/pdf_template.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    splitScreenMode: true,
    builder: () => ChangeNotifierProvider<Controller>(
      create: (BuildContext context) {
        return Controller();
      },
      child: MaterialApp(
        builder: (context, widget) {
          // here

          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        theme: ThemeData(
            sliderTheme: SliderThemeData(
              trackHeight: 2,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0),
              overlayColor: Colors.red.withAlpha(32),
            ),
            textTheme: TextTheme(
              subtitle1: TextStyle(color: Colors.white),
              subtitle2: RegisterPageConstansts.textFieldHintStyle,
            ),
            fontFamily: "Avenir"),
        home: PdfTemplate(),
      ),
    ),
  ));
  FlutterNativeSplash.remove();
}
