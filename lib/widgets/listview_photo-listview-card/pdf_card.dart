import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/constansts/widget_const/widget_const.dart';
import 'package:untitled1/controller/controller.dart';

import '../../constansts/icon_constants/icon_constants.dart';
import '../../pages/pdf_page/pdf_template.dart';

class PdfCard extends StatefulWidget {
  final int index;

  const PdfCard({Key? key, required this.index}) : super(key: key);

  @override
  State<PdfCard> createState() => _PdfCardState();
}

class _PdfCardState extends State<PdfCard> {
  var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<Controller>(context, listen: false).listOrSplit == true
        ? buildListTile(context)
        : buildGridViewFolder(context);
  }

  Slidable buildListTile(context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: UniqueKey(),
      // The end action pane is the one at the right or the bottom side.
      startActionPane: ActionPane(
        dragDismissible: false,
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 2.w, right: 3.w, top: 3.h, bottom: 3.h),
              child: InkWell(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 28, 187, 158),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: Svg(IconConst.pdfShareIcon,
                              color: Colors.white, size: Size(20.w, 20.w))),
                      Text(
                        WidgetConst.share,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  fToast.showToast(
                    child: downloadCompleteToast(),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: 3.h, top: 3.h, left: 3.w, right: 3.w),
              child: InkWell(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 178, 255),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image:
                              Svg(IconConst.pdfSave, size: Size(20.w, 20.w))),
                      Text(
                        WidgetConst.save,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  fToast.showToast(
                    child: downloadNotCompleteToast(),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      endActionPane: ActionPane(
        dragDismissible: false,
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 2.w, right: 3.w, top: 3.h, bottom: 3.h),
              child: InkWell(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 175, 81),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: Svg(IconConst.rename, size: Size(20.w, 20.w))),
                      Text(
                        WidgetConst.rename,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return renameFolderTitleDialog(context);
                      });
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: 3.h, top: 3.h, left: 3.w, right: 3.w),
              child: InkWell(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 81, 81),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: Svg(IconConst.delete, size: Size(20.w, 20.w))),
                      Text(
                        WidgetConst.delete,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return deleteFolderDialog(context);
                      });
                },
              ),
            ),
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: Padding(
        padding: EdgeInsets.only(left: 5.0.w, right: 7.w, top: 3.h, bottom: 0),
        child: Card(
          color: const Color(0xfff3f7fd),
          child: ListTile(
            onTap: () {
              routeTo(const PdfTemplate());
            },
            leading: Transform.translate(
              offset: Offset(-15.w, 3.h),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image(
                    image: Svg(IconConst.myPdfIcon, size: Size(55.w, 52.h)),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(
                        image: Svg(IconConst.folderIconTop,
                            size: Size(18.w, 15.h)),
                      ),
                      // 265
                      Text(
                        "265",
                        style: GoogleFonts.roboto(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 6.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            title: Transform.translate(
              offset: const Offset(-20, 0),
              child: Text(
                  "${WidgetConst.docTitle} 23-11-2020 12:20:42 PM (${widget.index})",
                  style: const TextStyle(
                      color: Color(0xff494949),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  textAlign: TextAlign.left),
            ),
            subtitle: Transform.translate(
              offset: const Offset(-20, 0),
              child: const Text("23-11-2020 12:20",
                  style: TextStyle(
                      color: Color(0x80272643),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  textAlign: TextAlign.left),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildGridViewFolder(context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 39, 38, 67).withOpacity(0.7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image(
                  image: Svg(
                    IconConst.folderIcon,
                    size: Size(80.w, 80.w),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image:
                          Svg(IconConst.folderIconTop, size: Size(31.w, 25.h)),
                    ),
                    // 265
                    Text(
                      "265",
                      style: GoogleFonts.roboto(
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 6.0),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 150.w,
              height: 35.h,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 39, 38, 67),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  "${WidgetConst.doc} 23-11-2020 12:20:42 PM (${widget.index}) ${WidgetConst.doc}  23-11-2020",
                  style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Dialog renameFolderTitleDialog(BuildContext context) {
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
                        color: Color.fromARGB(255, 245, 141, 44),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              WidgetConst.editTitle,
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
                      child: TextFormField(
                        initialValue:
                            '${WidgetConst.pdfScanner} ${outputFormat.format(DateTime.now())}',
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    0), //Change this value to custom as you like
                            isDense: true, // and add this line

                            hintText:
                                '${WidgetConst.pdfScanner} ${outputFormat.format(DateTime.now())}',
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
                                      WidgetConst.cancel,
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
                                onTap: () {},
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Text(
                                      WidgetConst.save,
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

  Dialog deleteFolderDialog(BuildContext context) {
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
                height: 144.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Top Side
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Color.fromARGB(255, 252, 28, 28),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              WidgetConst.delete,
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
                        WidgetConst.wantDelete,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
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
                                      WidgetConst.cancel,
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
                                onTap: () {},
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Text(
                                      WidgetConst.yes,
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

  downloadCompleteToast() {
    Widget toast = Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: const Color.fromARGB(255, 15, 227, 167).withOpacity(0.75),
        ),
        width: 257.w,
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(
              width: 25.w,
            ),
            Text(
              WidgetConst.downloadCompleted,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ));
    return toast;
  }

  downloadNotCompleteToast() {
    Widget toast = Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: const Color.fromARGB(255, 252, 28, 28).withOpacity(0.75),
        ),
        width: 257.w,
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.circleXmark,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(
              width: 25.w,
            ),
            Text(
              WidgetConst.downloadNotCompleted,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ));
    return toast;
  }

  routeTo(Widget page) {
    return Navigator.push(
      context,
      PageTransition(child: page, type: PageTransitionType.leftToRight),
    );
  }

  goBack() {
    Navigator.of(context).pop();
  }

  dialogShow(Widget page) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return page;
        });
  }
}
