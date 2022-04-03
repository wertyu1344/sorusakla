import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:untitled1/constansts/icon_constants/icon_constants.dart';

import '../../constansts/pdf_page/pdf_page.dart';

class PdfTemplate extends StatelessWidget {
  const PdfTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 595,
          height: 842,
          child: Column(
            children: [
              //Top
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 81, 78, 243)
                      ..withOpacity(0.84),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  height: 94.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 9.w,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        width: 126.w,
                        height: 76.h,
                        child: Column(
                          children: [
                            buildDate(PdfConst.startDate),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildDate(PdfConst.endDate)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                "www.sorusakla.com",
                style: TextStyle(
                  color: const Color.fromARGB(
                    255,
                    0,
                    73,
                    88,
                  ).withOpacity(0.8),
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: (Container(
                              color: Colors.red,
                            )),
                          ),
                          Expanded(
                            child: (Container(
                              color: Colors.green,
                            )),
                          ),
                          Expanded(
                            child: (Container(
                              color: Colors.deepOrange,
                            )),
                          ),
                          Expanded(
                            child: (Container(
                              color: Colors.greenAccent,
                            )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0.sp),
                              child: Container(
                                width: 2,
                                color: const Color.fromARGB(255, 171, 171, 171),
                              ),
                            ),
                          ),
                          RotationTransition(
                            turns: AlwaysStoppedAnimation(270 / 360),
                            child: Image(
                              image: Svg(IconConst.drawerSoruSakla,
                                  size: Size(70, 50)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Container(
                                width: 2,
                                color: const Color.fromARGB(255, 171, 171, 171),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: (Container(
                              color: Colors.red,
                            )),
                          ),
                          Expanded(
                            child: (Container(
                              color: Colors.green,
                            )),
                          ),
                          Expanded(
                            child: (Container(
                              color: Colors.deepOrange,
                            )),
                          ),
                          Expanded(
                            child: (Container(
                              color: Colors.greenAccent,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Bottom

              Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 38,
                      color: const Color.fromARGB(255, 233, 245, 254),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildDate(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 9.sp),
        ),
        Container(
            width: 89.w,
            height: 22.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Icon(Icons.date_range, size: 10.13.w),
              ],
            ))
      ],
    );
  }
}
