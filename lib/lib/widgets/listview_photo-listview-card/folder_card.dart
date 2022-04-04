import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/controller/controller.dart';

import '../../constansts/icon_constants/icon_constants.dart';
import '../../constansts/widget_const/widget_const.dart';
import '../../pages/home_page/home_in_folder/home_in_folder.dart';

class FolderCard extends StatefulWidget implements Widget {
  final String title;
  final DateTime createDate;
  final int index;
  final int numberOfPhoto;

  bool noSplit = true;
  FolderCard(
      {Key? key,
      required this.numberOfPhoto,
      required this.index,
      required this.noSplit,
      required this.title,
      required this.createDate})
      : super(key: key);

  @override
  State<FolderCard> createState() => _FolderCardState();
}

class _FolderCardState extends State<FolderCard> {
  var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');

  @override
  Widget build(BuildContext context) {
    return Provider.of<Controller>(context).listOrSplit == true ||
            widget.noSplit == true
        ? buildListTile(context)
        : buildGridViewFolder(context);
  }

  Slidable buildListTile(context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: UniqueKey(),

      // The end action pane is the one at the right or the bottom side.
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
                        return editDialog(context);
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
              Provider.of<Controller>(context, listen: false)
                  .folderTitleChange(widget.title);
              routeTo(HomeInFolderPage(
                sayfaState: widget.index,
              ));
            },
            leading: Transform.translate(
              offset: Offset(-15.w, 3.h),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image(
                    image: Svg(IconConst.folderIcon, size: Size(55.w, 52.h)),
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
                        "${widget.numberOfPhoto}",
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
              child: Text(widget.title,
                  style: const TextStyle(
                      color: Color(0xff494949),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  textAlign: TextAlign.left),
            ),
            subtitle: Transform.translate(
              offset: const Offset(-20, 0),
              //TODO
              child: Text(
                  "${widget.createDate.day}-${widget.createDate.month}-${widget.createDate.year} ${widget.createDate.hour < 9 ? "0${widget.createDate.hour}" : widget.createDate.hour}:${widget.createDate.second} ",
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

  Padding buildGridViewFolder(context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: InkWell(
        onLongPress: () {
          Controller2.dialogShow(longPressDialog(context), context);
        },
        onTap: () {
          routeTo(HomeInFolderPage(
            sayfaState: widget.index,
          ));
          Provider.of<Controller>(context, listen: false)
              .folderTitleChange(widget.title);
        },
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
                        image: Svg(IconConst.folderIconTop,
                            size: Size(31.w, 25.h)),
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
                    widget.title,
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
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
                              "Edit Title",
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
                            'PDF Scanner ${outputFormat.format(DateTime.now())}',
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    0), //Change this value to custom as you like
                            isDense: true, // and add this line

                            hintText:
                                'PDF Scanner ${outputFormat.format(DateTime.now())}',
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
                                      "Cancel",
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
                                      "Save",
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

  Dialog longPressDialog(BuildContext context) {
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
                height: 80.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Top Side
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.tealAccent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              WidgetConst.whatDoYouWant,
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
                                  Controller2.dialogShow(
                                      deleteFolderDialog(context), context);
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Text(
                                      WidgetConst.delete,
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
                                  Controller2.goBack(context);
                                  Controller2.dialogShow(
                                      editDialog(context), context);
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Text(
                                      WidgetConst.edit,
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

  routeTo(Widget page) {
    return Navigator.push(
      context,
      PageTransition(child: page, type: PageTransitionType.leftToRight),
    );
  }
}
