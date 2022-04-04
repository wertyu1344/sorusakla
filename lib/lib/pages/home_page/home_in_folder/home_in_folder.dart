import 'dart:io';

import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/constansts/icon_constants/icon_constants.dart';
import 'package:untitled1/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:untitled1/widgets/drawer_widget/drawer_widget.dart';

import '../../../constansts/home_page/home_page.dart';
import '../../../controller/controller.dart';
import '../../capture_paper_page/photo_pick/photo_pick_page.dart';

class HomeInFolderPage extends StatefulWidget {
  final List floatingButtons = [];
  final int sayfaState;
  HomeInFolderPage({required this.sayfaState, Key? key}) : super(key: key);

  @override
  State<HomeInFolderPage> createState() => _HomeInFolderPageState();
}

class _HomeInFolderPageState extends State<HomeInFolderPage> {
  File? _scannedImage;

  var isSearchBarVisible = true;
  var deger = Future.value(false);
  var aaa = -1;

  //Floating
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
  String folderName =
      '${HomeConst.pdfScanner} ${DateFormat('MM/dd/yyyy hh:mm a').format(DateTime.now())}';
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<Controller>(context, listen: false)
          .sortByAlphabetAtoZHomeInFolderForFolder(Controller.folderList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: buildFloatingButton(),
          drawer: const MyDrawerWidget(),
          body: Column(
            children: [
              buildMyAppBar(context),
              Provider.of<Controller>(context).listOrSplit == true
                  ? Expanded(child: buildListView())
                  : Expanded(child: buildGridView()),
            ],
          )),
    );
  }

  MyAppBar buildMyAppBar(BuildContext context) {
    return MyAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Menu Icon
          Padding(
            padding: EdgeInsets.only(left: 12.0.w, right: 20.w),
            child: Builder(
                builder: (context) => IconButton(
                      icon: Image(image: Svg(IconConst.settingsBackArrowIcon)),
                      onPressed: () {
                        setState(() {
                          Provider.of<Controller>(context, listen: false)
                              .normalSplitType();
                        });
                        Controller2.goBack(context);
                      },
                    )),
          ),
          //SoruSakla Text
          Expanded(
            child: Center(
              child: Text(
                Provider.of<Controller>(context, listen: true).folderTitle,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),

          SizedBox(
            width: 20.w,
          ),
          //List Icon
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              tooltip: HomeConst.menu,
              child:
                  Image(image: Svg(IconConst.listIcon, size: Size(32.w, 32.w))),
              itemBuilder: (context) => [
                buildPopupMenuItem(
                  HomeConst.aToz,
                  "sortByAtoZ",
                  const Icon(FontAwesomeIcons.arrowDownAZ),
                ),
                buildPopupMenuItem(
                  HomeConst.zToa,
                  "sortByZtoA",
                  const Icon(FontAwesomeIcons.arrowDownZA),
                ),
              ],
            ),
          ),

          //List Icon
          IconButton(
              icon: Image(
                  image: Svg(Provider.of<Controller>(context, listen: true)
                              .listOrSplit ==
                          true
                      ? IconConst.splitViewIcon
                      : IconConst.listViewIcon)),
              onPressed: () {
                Provider.of<Controller>(context, listen: false)
                    .changeSplitType();
              }),
          const SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }

  Align buildFloatingButton() {
    return Align(
      alignment: Alignment(0.8.w, 0.7.h),
      child: SpeedDial(
        buttonSize: Size(60.h, 60.h),
        backgroundColor: Colors.red,
        child: Container(
            decoration: IconConst.floatingBackgroundColor,
            child: Center(
              child: Icon(Icons.add, size: 36.sp),
            )),
        icon: Icons.add,
        activeIcon: Icons.close,
        activeChild: Container(
          decoration: IconConst.floatingBackgroundColor,
          child: Center(
            child: Icon(Icons.close, size: 36.sp),
          ),
        ),
        spacing: 3,
        openCloseDial: isDialOpen,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        childrenButtonSize: childrenButtonSize,
        visible: visible,
        direction: speedDialDirection,
        switchLabelPosition: switchLabelPosition,
        closeManually: closeManually,

        /// If false, backgroundOverlay will not be rendered.
        renderOverlay: renderOverlay,
        useRotationAnimation: useRAnimation, elevation: 8.0,
        isOpenOnStart: false,
        animationSpeed: 200,

        children: [
          SpeedDialChild(
              child: Container(
                  decoration: IconConst.floatingBackgroundColor,
                  child: Center(
                    child: Image(
                      image: Svg(IconConst.floatingHomeCamera,
                          size: const Size(36, 36)),
                    ),
                  )),
              onTap: () {
                setState(() => rmicons = !rmicons);

                Controller2.routeTo(PhotoPickPage(), context);
              },
              onLongPress: () {}),
          SpeedDialChild(
              child: Container(
                  decoration: IconConst.floatingBackgroundColor,
                  child: Center(
                    child: Image(
                      image: Svg(IconConst.floatingHomeFolder,
                          size: const Size(36, 36)),
                    ),
                  )),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              onTap: () {
                setState(() => rmicons = !rmicons);
                Controller2.dialogShow(createFolderDialog(context), context);
              },
              onLongPress: () {}),
        ],
      ),
    );
  }

  //GridView

  GridView buildGridView() {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: (Controller.folderList.length + Controller.photoList.length),
      padding: const EdgeInsets.all(25),
      itemBuilder: (context, index) {
        aaa = index;
        int lenght = index + 1;
        if (lenght <= Controller.folderList.length) {
          return Controller.folderList[index];
        }
        return Controller.photoList[index - Controller.folderList.length];
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  //ListView
  ListView buildListView() {
    return ListView.builder(
      itemCount: Controller.folderList.length + Controller.photoList.length,
      itemBuilder: (context, index) {
        aaa = index;
        int lenght = index + 1;
        if (lenght <= Controller.folderList.length) {
          return Controller.folderList[index];
        }

        return Controller.photoList[index - Controller.folderList.length];
      },
    );
  }

  PopupMenuItem<dynamic> buildPopupMenuItem(
      String title, String sortType, Widget icon) {
    return PopupMenuItem(
      onTap: () {
        sortType == "sortByAtoZ"
            ? Provider.of<Controller>(context, listen: false)
                .sortByAlphabetAtoZHomeInFolderForPhoto(Controller.photoList)
            : null;
        sortType == "sortByZtoA"
            ? Provider.of<Controller>(context, listen: false)
                .sortByAlphabetZtAZHomeInFolderForPhoto(Controller.photoList)
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
                decoration: const BoxDecoration(
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

  openImageScanner(BuildContext context) async {
    var image = await DocumentScannerFlutter.launch(context,
        //source: ScannerFileSource.CAMERA,
        labelsConfig: {
          ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Next Step",
          ScannerLabelsConfig.ANDROID_OK_LABEL: "OK"
        });
    if (image != null) {
      _scannedImage = image;
      setState(() {});
    }
  }
}
