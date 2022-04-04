import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constansts/icon_constants/icon_constants.dart';
import '../../constansts/widget_const/widget_const.dart';
import '../../controller/controller.dart';
import '../../pages/home_page/full_screen_page/full_screen_page.dart';

class PhotoCard extends StatelessWidget {
  String selectedLesson;
  String selectedTopic;
  String selectedSubtopic;

  int viewCounter;
  final int index;
  final String imagePath, subtitle, title;
  final List<String> tags;
  String answer;
  PhotoCard({
    required this.selectedTopic,
    required this.selectedSubtopic,
    required this.selectedLesson,
    required this.answer,
    required this.index,
    Key? key,
    required this.imagePath,
    required this.subtitle,
    required this.tags,
    required this.title,
    this.viewCounter = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<Controller>(context).listOrSplit == true
        ? buildListviewPhoto(context)
        : buildGridViewPhoto(context);
  }

  InkWell buildListviewPhoto(context) {
    return InkWell(
      onTap: () => Controller2.routeTo(FullScreenPage(index: index), context),
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          height: 95.h,
          width: 364.w,
          child: Card(
            color: const Color.fromRGBO(243, 247, 253, 1),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 12.0.w),
                  child: Container(
                    width: 90.w,
                    height: 90.w,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 247, 253),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 2)),
                      ],
                      borderRadius: BorderRadius.circular(3),
                    ),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 80.w,
                      height: 80.w,
                      child: Image.asset(IconConst.x),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15.0.h),
                          child: Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: const Color.fromRGBO(73, 73, 73, 1)),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: const Color.fromRGBO(39, 38, 67, 0.5),
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SingleChildScrollView(
                          child: Row(
                            children: List.generate(
                              tags.length,
                              (index) => bringCardItems(tags[index]),
                            ),
                          ),
                          scrollDirection: Axis.horizontal,
                        ),
                      ]),
                ),
                Align(
                  child: InkWell(
                    child: const Icon(FontAwesomeIcons.ellipsisVertical),
                    onTap: () async {
                      editPhotoDialog(context);
                    },
                  ),
                  alignment: Alignment.topRight,
                ),
              ],
            ),
          )),
    );
  }

  buildGridViewPhoto(context) {
    return InkWell(
      onTap: () {
        //TODO Controller2.routeTo(FullScreenCard(index: index), context);
      },
      child: Container(
        width: 150.w,
        height: 150.w,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(
                  IconConst.x2,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 5.w, bottom: 5.h),
                child: Container(
                  color:
                      const Color.fromARGB(255, 39, 38, 67).withOpacity(0.75),
                  alignment: Alignment.center,
                  width: 25.w,
                  height: 30.h,
                  child: Text(
                    "01",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 5.0.h, right: 5.w),
                child: InkWell(
                  onTap: () async {
                    Controller2.dialogShow(
                        await editPhotoDialog(context), context);
                  },
                  child: Container(
                    width: 14.h,
                    height: 14.h,
                    alignment: Alignment.center,
                    child: const Icon(
                      FontAwesomeIcons.ellipsisVertical,
                      size: 14,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 15, 15, 15)
                            .withOpacity(0.2)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void buildTag() {
    return tags.forEach((element) {
      bringCardItems(element);
    });
  }

  Padding bringCardItems(String tagName) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
      child: Container(
        height: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 2.h),
          child: Text(
            tagName,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                color: const Color.fromRGBO(0, 73, 88, 1),
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 12.sp),
          ),
        ),
      ),
    );
  }

  editPhotoDialog(BuildContext context) {
    return showModalBottomSheet(
        isDismissible: true,
        context: context,
        backgroundColor: const Color.fromARGB(255, 0, 73, 88),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0)),
                    onPressed: () {},
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 168.h,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            width: 375.w,
                            height: 73.h,
                            child: Center(
                              child: Text(
                                title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            color: Color.fromARGB(255, 162, 199, 253),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: 365.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 255, 81, 81),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                        image: Svg(IconConst.delete,
                                            size: Size(16.w, 16.w))),
                                    const Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 4.0.h, left: 5.w, right: 5.w),
                            child: Container(
                              width: 365.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 175, 81),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                      image: Svg(IconConst.rename,
                                          size: Size(16.w, 16.w))),
                                  Text(
                                    WidgetConst.edit,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          );
        });
  }
}
