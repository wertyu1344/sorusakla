import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/constansts/pdf_page/pdf_page.dart';
import 'package:untitled1/pages/pdf_page/pdf_view.dart';

import '../../constansts/icon_constants/icon_constants.dart';
import '../../constansts/pdf_page/pdf_page_filter_pop.dart';
import '../../controller/controller.dart';
import '../../widgets/TagSearch.dart';
import '../../widgets/select_photo_card/photo_picker_card.dart';

class PhotoSelectPage extends StatefulWidget {
  const PhotoSelectPage({Key? key}) : super(key: key);

  @override
  State<PhotoSelectPage> createState() => _PhotoSelectPageState();
}

class _PhotoSelectPageState extends State<PhotoSelectPage> {
  var onTab = true;
  @override
  Widget build(BuildContext context) {
    List<PhotoPickerCard> photoListt = Provider.of<Controller>(
      context,
    ).photoListt;
    int photoListLength =
        Provider.of<Controller>(context, listen: true).allPhotoListLength;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff6faff),
        body: Column(
          children: [
            Container(
              width: 375.w,
              height: 44.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Controller2.goBack(context),
                    child: SizedBox(
                      width: 44.w,
                      height: 44.w,
                      child: const Center(
                        child: Icon(Icons.arrow_back_ios_outlined),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "($photoListLength)${PdfConst.selectAll}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: photoListLength == photoListt.length
                              ? const Color(0xff514ef3)
                              : const Color(0x40000000),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 12.0.h,
                          top: 12.h,
                          right: 4.w,
                        ),
                        child: InkWell(
                          onTap: () {
                            Provider.of<Controller>(context, listen: false)
                                .selectAll();
                          },
                          child: Image(
                              image: Svg(
                                  photoListLength == photoListt.length
                                      ? IconConst.pdfSelectAllBlueIcon
                                      : IconConst.pdfSelectAllIcon,
                                  size: Size(20.w, 20.w))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 17.0.w, right: 22.w, top: 7.h, bottom: 7.h),
                        child: InkWell(
                          onTap: () {
                            Controller2.dialogShow(
                                filterPopUp(context), context);
                          },
                          child: Image(
                              image: Svg(IconConst.pdfFilterIcon,
                                  size: Size(30.w, 30.w))),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                children: photoListt,
              ),
            ),
            InkWell(
              onTap: () {
                Provider.of<Controller>(context, listen: false)
                            .allPhotoListLength >
                        0
                    ? Controller2.dialogShow(editDialog(context), context)
                    : null;
              },
              child: Container(
                color: photoListLength <= 0
                    ? const Color(0x40000000)
                    : const Color(0xff514ef3),
                width: 375.w,
                height: 80.h,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: Svg(IconConst.pdfFloatIcon,
                            size: Size(16.w, 19.68.h)),
                      ),
                      Text(
                        PdfConst.createPdf,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Dialog editDialog(BuildContext context) {
    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            width: double.maxFinite,
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
                    color: Color.fromARGB(255, 81, 78, 243),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          PdfConst.pdfTitle,
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
                    onTap: () {
                      setState(() {});
                      onTab = false;
                    },
                    initialValue:
                        '${PdfConst.pdfScanner} ${Controller2.outputFormat.format(DateTime.now())}',
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical:
                                0), //Change this value to custom as you like
                        isDense: true, // and add this line

                        hintText:
                            '${PdfConst.pdfScanner} ${Controller2.outputFormat.format(DateTime.now())}',
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
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Text(
                                  PdfConst.cancel,
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
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Controller2.routeTo(PdfViewPage(), context);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Text(
                                  PdfConst.create,
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

  Widget filterPopUp(context) {
    var selectedStartDate =
        Provider.of<Controller>(context, listen: false).selectedStartDate;
    var selectedFinishDate =
        Provider.of<Controller>(context, listen: false).selectedFinishDate;

    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            width: double.maxFinite,
            height: 418.h,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(PdfConst.filter,
                            style: MyPdfConstanst.buttonTitleTextStyleBold),
                        InkWell(
                          onTap: () => Controller2.goBack(context),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Image(
                              image: Svg(
                                  "assets/images/icons/my_pdf_icon/pdf_page_pop_up_icon.svg",
                                  size: Size(
                                    50.w,
                                    50.h,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              PdfConst.startDate,
                              textAlign: TextAlign.start,
                              style: MyPdfConstanst.buttonTitleTextStyle,
                            ),
                            ElevatedButton(
                              style: MyPdfConstanst.dateButtonuttonStyle,
                              onPressed: () {
                                Provider.of<Controller>(context, listen: false)
                                    .selectStartDate(context);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "${selectedStartDate.day}-${selectedStartDate.month}-${selectedStartDate.year}",
                                    style: MyPdfConstanst.buttonTextStyle,
                                  ),
                                  Image(
                                    image: Svg(
                                        "assets/images/icons/my_pdf_icon/button_calendar_icon.svg",
                                        size: Size(20.w, 20.h)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              PdfConst.finishDate,
                              textAlign: TextAlign.start,
                              style: MyPdfConstanst.buttonTitleTextStyle,
                            ),
                            ElevatedButton(
                              style: MyPdfConstanst.dateButtonuttonStyle,
                              onPressed: () {
                                Provider.of<Controller>(context, listen: false)
                                    .selectFinishDate(context);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "${selectedFinishDate.day}-${selectedFinishDate.month}-${selectedFinishDate.year}",
                                    style: MyPdfConstanst.buttonTextStyle,
                                  ),
                                  Image(
                                    image: Svg(
                                        "assets/images/icons/my_pdf_icon/button_calendar_icon.svg",
                                        size: Size(20.w, 20.h)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      color: const Color.fromRGBO(234, 238, 244, 0.6),
                      child: TagSearch(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: InkWell(
                      onTap: () {
                        Controller2.goBack(context);
                      },
                      child: Container(
                        width: 120.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 81, 78, 243),
                            borderRadius: BorderRadius.circular(70)),
                        child: Center(
                          child: Text(
                            PdfConst.apply,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget pickDate(
      {String title = "", context, required DateTime selectedDate}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: MyPdfConstanst.buttonTitleTextStyle,
        ),
        ElevatedButton(
          style: MyPdfConstanst.dateButtonuttonStyle,
          onPressed: () {
            Provider.of<Controller>(context, listen: false)
                .selectStartDate(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                style: MyPdfConstanst.buttonTextStyle,
              ),
              Image(
                image: Svg(
                    "assets/images/icons/my_pdf_icon/button_calendar_icon.svg",
                    size: Size(20.w, 20.h)),
              )
            ],
          ),
        )
      ],
    );
  }
}
