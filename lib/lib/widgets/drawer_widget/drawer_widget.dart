import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:untitled1/pages/home_page/home_page/home_page.dart';
import 'package:untitled1/pages/pdf_page/pdf_page.dart';
import 'package:untitled1/pages/setting_pages/setting_screen.dart';
import 'package:untitled1/pages/tag_page/tag_page.dart';

import '../../constansts/icon_constants/icon_constants.dart';
import '../../constansts/widget_const/widget_const.dart';
import '../../controller/controller.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 60, left: 12, right: 12),
                child: Image(
                  image:
                      Svg(IconConst.drawerSoruSakla, size: Size(160.w, 60.h)),
                )),
            buildCard(
                Image(image: Svg(IconConst.drawerHome, size: Size(30.w, 30.w))),
                WidgetConst.home,
                HomePage(),
                context),
            buildCard(
                Image(image: Svg(IconConst.drawerPdf, size: Size(30.w, 30.w))),
                WidgetConst.myPdf,
                const PdfPage(),
                context),
            buildCard(
                Image(image: Svg(IconConst.drawerTag, size: Size(30.w, 30.w))),
                WidgetConst.tagManager,
                TagPage(),
                context),
            buildCard(
                Image(
                    image:
                        Svg(IconConst.drawerSetting, size: Size(30.w, 30.w))),
                WidgetConst.setting,
                SettingScreen(),
                context),
          ],
        ),
      ),
    );
  }

  Center buildCard(Widget icon, String title, Widget page, context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
        child: ListTile(
          onTap: () {
            Controller2.routeTo(page, context);
          },
          leading: icon,
          title: Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 122, 137, 158),
            ),
          ),
        ),
      ),
    );
  }
}
