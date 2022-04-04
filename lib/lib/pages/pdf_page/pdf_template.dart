import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:untitled1/constansts/icon_constants/icon_constants.dart';

import '../../constansts/pdf_page/pdf_page.dart';
import '../../constansts/soru/soru.dart';

class PdfTemplate extends StatefulWidget {
  PdfTemplate({Key? key}) : super(key: key);

  @override
  State<PdfTemplate> createState() => _PdfTemplateState();
}

class _PdfTemplateState extends State<PdfTemplate> {
  double totalSize = 0;
  double totalSize2 = 0;

  var reset = false;
  File image = File("assets/images/soru/soru1.png");
  double sizeBox1 = 0;
  double sizeBox2 = 0;
  var sayac = 0;
  var sayac1 = 0;
  var sayac2 = 0;
  List soruList = [
    Soru.soru1,
    Soru.soru2,
    Soru.soru3,
    Soru.soru4,
    Soru.soru5,
    Soru.soru6,
  ];

  Map list1 = {};

  Map list2 = {};

  Future<double> _calculateImageDimension(String stringImage) {
    Completer<double> completer = Completer();
    Image image = Image.asset(stringImage);
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          var size = myImage.height.toDouble();
          completer.complete(size);
        },
      ),
    );

    return completer.future;
  }

  Future<Map> imageHesapla1() async {
    for (var image in soruList) {
      if (totalSize + await _calculateImageDimension(image) < 640) {
        sayac++;
        totalSize = totalSize + await _calculateImageDimension(image);
        list1[image] = await _calculateImageDimension(image);
        sizeBox1 = (640.0 - totalSize) / (sayac - 1);
        print("$sayac. image boyutu ${await _calculateImageDimension(image)}");
      }
    }
    print("liste 1 toplam boyut =${totalSize + (sizeBox1 * (sayac - 1))}"
        "\nliste 1 toplam eleman $sayac"
        "\nliste 1 bir sized box=${sizeBox1}"
        "\n soru boyu =$totalSize");
    return list1;
  }

  imageHesapla2() async {
    for (var image in soruList) {
      sayac1++;
      if (sayac1 >= sayac + 1) {
        if (totalSize2 + await _calculateImageDimension(image) < 640) {
          sayac1++;
          sayac2++;
          totalSize2 = totalSize2 + await _calculateImageDimension(image);
          list2[image] = await _calculateImageDimension(image);
          sizeBox2 = (640.0 - totalSize2) / (sayac2 - 1);
        }
      }
    }
    print("liste 2 toplam boyut =${totalSize2 + (sizeBox2 * (sayac2 - 1))}"
        "\nliste 2 toplam eleman $sayac2"
        "\nliste 2 bir sized box=${sizeBox2}"
        "\n soru boyu =$totalSize2");
    return list2;
  }

  birlestir() async {
    soruList.shuffle();
    await imageHesapla1();

    await imageHesapla2();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    birlestir();
  }

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
                    Container(
                      width: 230,
                      child: ListView.separated(
                        itemCount: list1.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              list1.keys.elementAt(index),
                              height: list1.values.elementAt(index),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: sizeBox1,
                          );
                        },
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
                    Container(
                      width: 230,
                      child: ListView.separated(
                        itemCount: list2.length,
                        itemBuilder: (context, index) {
                          return Container(
                              height: list2.values.elementAt(index),
                              child: Image.asset(list2.keys.elementAt(index)));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: sizeBox2,
                          );
                        },
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
