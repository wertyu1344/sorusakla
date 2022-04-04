import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/pages/setting_pages/membership_screen.dart';
import 'package:untitled1/pages/setting_pages/settings_profile/profile_screen.dart';
import 'package:untitled1/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:untitled1/widgets/drawer_widget/drawer_widget.dart';
import 'package:untitled1/widgets/switch_card/switch_card.dart';

import '../../constansts/icon_constants/icon_constants.dart';
import '../../constansts/onboard_login_register/login_register.dart';
import '../../constansts/setting_page/setting_page.dart';
import '../../controller/controller.dart';
import '../../widgets/gradient_text.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawerWidget(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  MyAppBar(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.0.w, right: 93.w),
                        child: Builder(
                          builder: (context) => IconButton(
                            icon: Image(image: Svg(IconConst.menuIcon)),
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: Svg(IconConst.smallSIcon,
                                    size: Size(27, 26))),
                            GradientText(
                              LogRegConstants.oruSakla,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.sp),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 15, 227, 167),
                                Color.fromARGB(255, 0, 186, 218),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  buildCard(
                      SettingConst.premiumMembership,
                      Color.fromARGB(255, 245, 141, 44),
                      null,
                      MembershipScreen()),
                  SwitchCard(
                      value: Controller2.localStorage,
                      title: SettingConst.useLocalStorage,
                      subtitle: SettingConst.useLocalStorageSub),
                  SwitchCard(
                    value: Controller2.showDefaultTags,
                    title: SettingConst.showDefaultTags,
                    subtitle: SettingConst.showDefaultTagsSub,
                  ),
                  buildCard(
                      SettingConst.selectLanguage,
                      Colors.black,
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          SettingConst.english,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const MembershipScreen()),
                  buildCard(
                      SettingConst.profile, Colors.black, null, ProfilePage()),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  width: 177.083,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      SettingConst.logout,
                      style: GoogleFonts.roboto(
                        color: const Color(0xfffc1c1c),
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xfffcc8c8))),
                  ),
                ),
              )
            ]),
      ),
    );
  }

  Padding buildSwitchCard(String title, String subtitle, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      child: SizedBox(
        height: 80,
        child: Card(
          color: const Color.fromARGB(255, 246, 250, 255),
          child: ListTile(
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 10),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),
              ),
            ),
            trailing: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Switch(
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      value = val;
                    });
                  },
                  value: value,
                )),
          ),
        ),
      ),
    );
  }

  Padding buildCard(String title, Color color, var subtitle, Widget page) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 80,
        child: Card(
          color: const Color.fromARGB(255, 246, 250, 255),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {
                Controller2.routeTo(page, context);
              },
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w400, color: color),
                ),
              ),
              subtitle: subtitle,
              trailing: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Icon(Icons.arrow_forward_ios_rounded, color: color),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
