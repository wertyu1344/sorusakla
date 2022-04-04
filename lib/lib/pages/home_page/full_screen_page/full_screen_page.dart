import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/constansts/home_page/home_page.dart';
import 'package:untitled1/widgets/listview_photo-listview-card/photo_card.dart';

import '../../../constansts/icon_constants/icon_constants.dart';
import '../../../controller/controller.dart';
import '../../../widgets/edit_alert_dialog.dart';

class FullScreenPage extends StatefulWidget {
  final int index;

  const FullScreenPage({required this.index, Key? key}) : super(key: key);

  @override
  State<FullScreenPage> createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage> {
  late int oAnkiIndex;
  late PhotoCard oAnkiPhotoCard = Controller.photoList[oAnkiIndex];
  var i = 0;

  @override
  void initState() {
    super.initState();
    oAnkiIndex = Controller.photoList
        .indexWhere((element) => element.index == widget.index);
    oAnkiPhotoCard = Controller.photoList[oAnkiIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 34, 52, 60),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 34, 52, 60),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //AppBar
              SizedBox(
                  width: 375.w,
                  height: 72.h,
                  child: ListTile(
                    leading: InkWell(
                      onTap: () => Controller2.goBack(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(oAnkiPhotoCard.title),
                  )),
              SizedBox(
                height: 9.h,
              ),

              //Body
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            if (oAnkiIndex >= 1) {
                              setState(() {
                                oAnkiIndex--;
                              });
                            }
                          },
                          child: Image(
                            image: Svg(IconConst.left_arrow_full_screen_page,
                                size: const Size(13, 23)),
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Image(
                            image: AssetImage(
                                "assets/images/home_page_images/Bitmap.png"),
                            fit: BoxFit.fitWidth,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: InkWell(
                          onTap: () {
                            if (oAnkiIndex < Controller.photoList.length - 1) {
                              setState(() {
                                oAnkiIndex++;
                              });
                            }
                          },
                          child: Image(
                            image: Svg(IconConst.right_arrow_full_screen_page,
                                size: const Size(13, 23)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => photoInfoPopUp(context),
                            icon: Icon(
                              Icons.info,
                              color: Colors.white,
                              size: 24.w,
                            )),
                        Container(
                          alignment: Alignment.center,
                          width: 58.w,
                          height: 27.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 150, 167, 175)
                                  .withOpacity(0.47)),
                          child: Text(
                            "${oAnkiIndex + 1}/${Controller.photoList.length}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Controller2.dialogShow(
                                EditAlertDialog(
                                    oAnkiPhotoCard: oAnkiPhotoCard,
                                    callBackAnswer: (value) {
                                      setState(() {});
                                    }),
                                context);
                          },
                          icon: Icon(
                            FontAwesomeIcons.penToSquare,
                            color: Colors.white,
                            size: 24.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 96.h,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 48, 68, 78),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Minus
                        Container(
                          width: 50.w,
                          height: 50.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 150, 167, 175),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              color: const Color.fromARGB(255, 48, 68, 78),
                              onPressed: () {
                                setState(() {
                                  if (oAnkiPhotoCard.viewCounter > 0) {
                                    oAnkiPhotoCard.viewCounter--;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 88,
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x4d0fda89),
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                  spreadRadius: 0)
                            ],
                            gradient: LinearGradient(
                                begin: Alignment(0, 0),
                                end: Alignment(0, 1),
                                colors: [Color(0xff514ef3), Color(0xff4c49dc)]),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.remove_red_eye,
                                size: 16.sp,
                                color: Colors.white,
                              ),
                              Text(
                                oAnkiPhotoCard.viewCounter.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        //Plus
                        Container(
                          width: 50.w,
                          height: 50.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 150, 167, 175),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  oAnkiPhotoCard.viewCounter++;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Color.fromARGB(255, 48, 68, 78),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  photoInfoPopUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (a) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          contentPadding: const EdgeInsets.all(10),
          content: SizedBox(
            width: 350.w,
            height: 415.h,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: alertDialogContainer("${HomeConst.answer}: ",
                            answer: oAnkiPhotoCard.answer, right: 4)),
                    Expanded(child: alertDialogContainer("AYT", left: 4)),
                  ],
                ),
                buildSizedBox(),
                alertDialogContainer(oAnkiPhotoCard.selectedLesson),
                buildSizedBox(),
                Row(
                  children: [
                    Expanded(
                        child: alertDialogContainer(
                            oAnkiPhotoCard.selectedTopic,
                            right: 4)),
                    Expanded(
                        child: alertDialogContainer(
                            oAnkiPhotoCard.selectedSubtopic,
                            left: 4)),
                  ],
                ),
                buildSizedBox(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(246, 250, 253, 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: ListView.builder(
                      itemCount: oAnkiPhotoCard.tags.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image(
                                      image: Svg(
                                          "assets/images/icons/homepage_icons/popUpTagIcon.svg",
                                          size: Size(20.w, 20.h))),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 50.h,
                                    child: Text(
                                      oAnkiPhotoCard.tags[index],
                                      style: TextStyle(
                                          color: const Color.fromRGBO(
                                              9, 44, 76, 1),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            index < oAnkiPhotoCard.tags.length - 1
                                ? const Divider(
                                    height: 1,
                                    color: Color.fromRGBO(126, 146, 162, 0.2),
                                  )
                                : const SizedBox()
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding alertDialogContainer(String content,
      {double right = 0, double left = 0, var answer = ""}) {
    return Padding(
      padding: EdgeInsets.only(right: right, left: left),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(126, 146, 162, 0.2)),
            color: const Color.fromRGBO(246, 250, 253, 1),
            borderRadius: BorderRadius.circular(12)),
        height: 40.h,
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              content,
              style: TextStyle(
                  color: const Color.fromRGBO(126, 146, 162, 1),
                  fontSize: 12.sp),
            ),
            Text(
              answer,
              style: TextStyle(
                  color: const Color.fromRGBO(0, 73, 88, 1),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }

  buildSizedBox() {
    return SizedBox(
      height: 5.w,
    );
  }
}
