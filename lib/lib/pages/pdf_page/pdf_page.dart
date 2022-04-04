import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/pages/pdf_page/photo_select.dart';

import '../../constansts/icon_constants/icon_constants.dart';
import '../../constansts/onboard_login_register/login_register.dart';
import '../../constansts/pdf_page/pdf_page.dart';
import '../../controller/controller.dart';
import '../../widgets/app_bar_widget/app_bar_widget.dart';
import '../../widgets/drawer_widget/drawer_widget.dart';
import '../../widgets/gradient_text.dart';
import '../../widgets/listview_photo-listview-card/pdf_card.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({Key? key}) : super(key: key);

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  var isSearchBarVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: buildFloatingButton(),
          drawer: const MyDrawerWidget(),
          body: Column(
            children: [
              buildAppBar(context),
              Expanded(
                child: ListView(
                  children: [
                    PdfCard(index: 1),
                    PdfCard(index: 1),
                    PdfCard(index: 1),
                    PdfCard(index: 1),
                    PdfCard(index: 1),
                    PdfCard(index: 1),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Align buildFloatingButton() {
    return Align(
        alignment: Alignment(0.8.w, 0.7.h),
        child: SpeedDial(
          onPress: () {
            Controller2.routeTo(PhotoSelectPage(), context);
          },
          buttonSize: Size(60.h, 60.h),
          backgroundColor: Colors.red,
          child: Container(
              decoration: IconConst.pdfFloatingBackgroundColor,
              child: Center(
                child: Image(
                  image: Svg(IconConst.pdfFloatIcon, size: const Size(36, 36)),
                ),
              )),
        ));
  }

  MyAppBar buildAppBar(BuildContext context) {
    return MyAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Menu Icon
          Padding(
            padding: EdgeInsets.only(left: 12.0.w, right: 20.w),
            child: Builder(
              builder: (context) => IconButton(
                icon: Image(image: Svg(IconConst.menuIcon)),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          //SoruSakla Text
          Visibility(
            visible: isSearchBarVisible == false ? true : false,
            child: Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: Svg(IconConst.smallSIcon, size: Size(27, 26))),
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
          ),

          //Search Bar
          Visibility(
            visible: isSearchBarVisible,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 20),
                child: TextField(
                  style: GoogleFonts.roboto(
                    color: const Color(0xff374a4e),
                    fontSize: 14.sp,
                  ),
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: InkWell(
                        child: const Icon(Icons.close),
                        onTap: () {
                          setState(() {
                            isSearchBarVisible = !isSearchBarVisible;
                          });
                        }),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 247, 253, 1),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          //Search Icon
          Visibility(
            visible: !isSearchBarVisible,
            child: IconButton(
                icon: Image(image: Svg(IconConst.searchIcon)),
                onPressed: () {
                  setState(() {
                    isSearchBarVisible =
                        isSearchBarVisible == true ? false : true;
                  });
                }),
          ),

          //List Icon
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              tooltip: PdfConst.menu,
              child:
                  Image(image: Svg(IconConst.listIcon, size: Size(32.w, 32.w))),
              itemBuilder: (context) => [
                buildPopupMenuItem(PdfConst.date, "sortByDateTime",
                    const Icon(Icons.date_range)),
                buildPopupMenuItem(PdfConst.alphabet, "sortByAlphabet",
                    const Icon(Icons.sort_by_alpha)),
                buildPopupMenuItem(
                  PdfConst.photoMtoL,
                  "sortByPhotoNumberMostToLess",
                  const Icon(FontAwesomeIcons.arrowDown91),
                ),
                buildPopupMenuItem(
                  PdfConst.photoLtoM,
                  "sortByPhotoNumberLessToMost",
                  const Icon(FontAwesomeIcons.arrowDown19),
                ),
              ],
            ),
          ), //List Icon
          SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }

  PopupMenuItem<dynamic> buildPopupMenuItem(
      String title, String sortType, Widget icon) {
    return PopupMenuItem(
      onTap: () {
        sortType == "sortByAlphabet"
            ? Provider.of<Controller>(context, listen: false)
                .sortByAlphabetHomePage()
            : null;
        sortType == "sortByDateTime"
            ? Provider.of<Controller>(context, listen: false)
                .sortByDateTimeHomePage()
            : null;
        sortType == "sortByPhotoNumberLessToMost"
            ? Provider.of<Controller>(context, listen: false)
                .sortByPhotoNumberLessToMostHomePage()
            : null;
        sortType == "sortByPhotoNumberMostToLess"
            ? Provider.of<Controller>(context, listen: false)
                .sortByPhotoNumberMostToLessHomePage()
            : null;
      },
      child: Row(
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
