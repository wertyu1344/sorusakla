import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/constansts/widget_const/widget_const.dart';
import 'package:untitled1/controller/controller.dart';

import '../../constansts/icon_constants/icon_constants.dart';
import '../../pages/tag_page/tag_in_folder/tag_in_folder.dart';

class AllTagCard extends StatefulWidget {
  final int index;
  bool split = true;
  final String title;
  AllTagCard(
      {Key? key, required this.index, required this.split, required this.title})
      : super(key: key);

  @override
  State<AllTagCard> createState() => _AllTagCardState();
}

class _AllTagCardState extends State<AllTagCard> {
  var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');

  @override
  Widget build(BuildContext context) {
    return buildListTile(context);
  }

  Visibility buildListTile(context) {
    return Visibility(
      visible: Controller2.showDefaultTags,
      child: Padding(
        padding: EdgeInsets.only(left: 5.0.w, right: 7.w, top: 3.h, bottom: 0),
        child: Card(
          color: const Color(0x66f3caac),
          child: ListTile(
            onTap: () {
              Provider.of<Controller>(context, listen: false)
                  .tagTitleChange(widget.title);
              Controller2.routeTo(
                  TagInFolderPage(
                    sayfaState: widget.index,
                  ),
                  context);
            },
            leading: Transform.translate(
              offset: Offset(-15.w, 3.h),
              child: Container(
                child: Image(
                  image: Svg(IconConst.allTagCardIcon, size: Size(63.w, 59.h)),
                ),
              ),
            ),
            title: Transform.translate(
              offset: const Offset(-20, 0),
              child: Text(WidgetConst.defaultTags,
                  style: const TextStyle(
                      color: Color(0xff494949),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  textAlign: TextAlign.left),
            ),
            subtitle: Transform.translate(
              offset: const Offset(-20, 0),
              child: Text("210 ${WidgetConst.photo} - 5 ${WidgetConst.tag}",
                  style: const TextStyle(
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

  Dialog editDialog(BuildContext context) {
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
                  borderRadius: BorderRadius.all(const Radius.circular(10)),
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
}
