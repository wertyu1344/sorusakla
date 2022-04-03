import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/constansts/icon_constants/icon_constants.dart';
import 'package:untitled1/pages/setting_pages/membership_expire_screen.dart';
import 'package:untitled1/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:untitled1/widgets/drawer_widget/drawer_widget.dart';
import 'package:untitled1/widgets/listview_photo-listview-card/folder_card.dart';

import '../../../constansts/home_page/home_page.dart';
import '../../../constansts/onboard_login_register/login_register.dart';
import '../../../controller/controller.dart';
import '../../../widgets/gradient_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  var isSearchBarVisible = true;
  var deger = Future.value(false);
  var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
  String folderName =
      '${HomeConst.pdfScanner} ${DateFormat('MM/dd/yyyy hh:mm a').format(DateTime.now())}';

  //Floating

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Provider.of<Controller>(context, listen: false).normalSplitType();
    });
  }

  Widget build(BuildContext context) {
    List<FolderClass> folders =
        Provider.of<Controller>(context, listen: true).homePageFolders;

    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: buildFloatingButton(),
          drawer: const MyDrawerWidget(),
          body: Column(
            children: [
              buildAppBar(context),
              Expanded(
                child: ListView.builder(
                    itemCount: folders.length,
                    itemBuilder: (context, index) {
                      return FolderCard(
                        numberOfPhoto: folders[index].numberOfPhoto,
                        title: folders[index].title,
                        noSplit: true,
                        index: index,
                        createDate: folders[index].createTime,
                      );
                    }),
              ),
            ],
          )),
    );
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
                    _controller.clear;
                    isSearchBarVisible =
                        isSearchBarVisible == true ? false : true;
                  });
                }),
          ),

          //Sort Icon

          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              tooltip: HomeConst.menu,
              child:
                  Image(image: Svg(IconConst.listIcon, size: Size(32.w, 32.w))),
              itemBuilder: (context) => [
                buildPopupMenuItem(HomeConst.date, "sortByDateTime",
                    const Icon(Icons.date_range)),
                buildPopupMenuItem(HomeConst.alphabet, "sortByAlphabet",
                    const Icon(Icons.sort_by_alpha)),
                buildPopupMenuItem(
                    HomeConst.photoMtoL,
                    "sortByPhotoNumberMostToLess",
                    const Icon(FontAwesomeIcons.arrowDown91)),
                buildPopupMenuItem(
                    HomeConst.photoLtoM,
                    "sortByPhotoNumberLessToMost",
                    const Icon(FontAwesomeIcons.arrowDown19)),
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

  Align buildFloatingButton() {
    return Align(
        alignment: Alignment(0.8.w, 0.7.h),
        child: SpeedDial(
          onPress: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return createFolderDialog(context);
                });
          },
          buttonSize: Size(60.h, 60.h),
          child: Container(
              decoration: IconConst.floatingBackgroundColor,
              child: Center(
                child: Image(
                  image: Svg(IconConst.floatingHomeFolderAdd,
                      size: const Size(36, 36)),
                ),
              )),
        ));
  }

  Dialog expiredDialog(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: WillPopScope(
          onWillPop: () => deger,
          child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {
                setState(() {
                  deger = Future.value(true);
                  Controller2.routeTo(MembershipExpireScreen(), context);
                });
              },
              child: Image(
                image: Svg(IconConst.buypro, size: Size(326.w, 82.h)),
              ),
            ),
          ),
        ));
  }

  Dialog createFolderDialog(BuildContext context) {
    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Center(
          child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                width: 314.w,
                height: 167.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Top Side
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Color.fromARGB(255, 15, 227, 167),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              HomeConst.createFolder,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),

                    //Mid
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        onChanged: (string) {
                          folderName = string;
                        },
                        initialValue:
                            '${HomeConst.folder} ${outputFormat.format(DateTime.now())}',
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    0), //Change this value to custom as you like
                            isDense: true, // and add this line

                            hintText:
                                '${HomeConst.folder} ${outputFormat.format(DateTime.now())}',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 39, 38, 67),
                            )),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                    ),
                    //Buttons
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //Cancel Button
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Text(
                                      HomeConst.cancel,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.sp,
                                          color: Colors.black),
                                    )),
                              ),
                            ),
                            VerticalDivider(
                              width: 1,
                            ),
                            //Create Button
                            //TODO

                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  List<FolderClass> folders =
                                      Provider.of<Controller>(context,
                                              listen: false)
                                          .homePageFolders;

                                  folders.add(FolderClass(
                                    numberOfPhoto: 3,
                                    createTime: DateTime.now(),
                                    title: folderName,
                                  ));
                                  Navigator.of(context).pop();
                                  setState(() {});
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Text(
                                      HomeConst.create,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.sp,
                                          color: Colors.black),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
