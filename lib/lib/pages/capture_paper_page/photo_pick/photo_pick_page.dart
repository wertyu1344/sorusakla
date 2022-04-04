import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/constansts/capture_page/capture_page.dart';
import 'package:untitled1/pages/capture_paper_page/crop_and_zoom_page/crop_and_zoom_page.dart';
import 'package:untitled1/pages/home_page/home_page/home_page.dart';

import '../../../controller/controller.dart';

class PhotoPickPage extends StatefulWidget {
  PhotoPickPage({Key? key}) : super(key: key);

  @override
  State<PhotoPickPage> createState() => _PhotoPickPageState();
}

class _PhotoPickPageState extends State<PhotoPickPage> {
  var isFlashOpen = false;

  var flashIcon = const Icon(Icons.flash_on, color: Colors.white, size: 24);
  var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Color.fromRGBO(39, 38, 67, 1),
              height: 72.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Controller2.dialogShow(
                            closeCameraDialog(context), context);
                      },
                      child: const Icon(
                        FontAwesomeIcons.x,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        changeFlash();
                      },
                      child: flashIcon,
                    ),
                  ],
                ),
              ),
            ),

            //Camera Here
            Container(color: Colors.white),

            Container(
              color: Color.fromRGBO(39, 38, 67, 1),
              height: 110.h,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 70.w,
                      height: 51.h,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10.h),
                          const Icon(
                            FontAwesomeIcons.image,
                            color: Colors.white,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            CaptureConst.gallery,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          CaptureConst.capture,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(height: 10.h),
                        InkWell(
                          onTap: () =>
                              Controller2.routeTo(CropAndZoomPage(), context),
                          child: Container(
                            width: 50.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                shape: BoxShape.circle,
                                color: const Color.fromRGBO(39, 38, 67, 1)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 70.w,
                      height: 51.h,
                      child: Row(
                        children: [
                          Stack(alignment: Alignment.topRight, children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              width: 40.w,
                              height: 40.w,
                            ),
                            Transform.translate(
                              offset: Offset(8.w, -8.w),
                              child: const CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 10,
                                child: Text(
                                  "24",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(width: 5.w),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  changeFlash() {
    setState(() {
      isFlashOpen = !isFlashOpen;
      isFlashOpen == true
          ? flashIcon = const Icon(
              Icons.flash_on,
              size: 24,
              color: Colors.white,
            )
          : flashIcon = const Icon(
              Icons.flash_off,
              size: 24,
              color: Colors.white,
            );
    });
  }

  Dialog closeCameraDialog(BuildContext context) {
    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Center(
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
                  height: 45.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Color.fromRGBO(245, 57, 102, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          CaptureConst.closeCamera,
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
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    CaptureConst.closeCameraAlert,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                //Buttons
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Cancel Button
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Controller2.goBack(context);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Text(
                                  CaptureConst.no,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      color: Colors.black),
                                )),
                          ),
                        ),
                        const VerticalDivider(
                          width: 1,
                        ),
                        //Create Button
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Controller2.routeTo(HomePage(), context);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Text(
                                  CaptureConst.yes,
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
          ),
        ));
  }
}
