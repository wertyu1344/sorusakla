import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:untitled1/controller/controller.dart';

import 'listview_photo-listview-card/photo_card.dart';

class EditAlertDialog extends StatefulWidget {
  final Function callBackAnswer;
  final PhotoCard oAnkiPhotoCard;
  const EditAlertDialog(
      {Key? key, required this.oAnkiPhotoCard, required this.callBackAnswer})
      : super(key: key);

  @override
  State<EditAlertDialog> createState() => _EditAlertDialogState();
}

class _EditAlertDialogState extends State<EditAlertDialog> {
  @override
  Widget build(BuildContext context) {
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
                  child: buildDropDownContainer(widget.oAnkiPhotoCard.answer, [
                    buildDropdownMenuItems("A"),
                    buildDropdownMenuItems("B"),
                    buildDropdownMenuItems("C"),
                    buildDropdownMenuItems("D"),
                    buildDropdownMenuItems("E"),
                  ]),
                ),
                buildSizedBoxWidth(),
                Expanded(
                  child: buildDropDownContainer("AYT", [
                    buildDropdownMenuItems("AYT"),
                    buildDropdownMenuItems("TYT")
                  ]),
                ),
              ],
            ),
            buildSizedBox(),
            buildDropDownContainer(
                widget.oAnkiPhotoCard.selectedLesson,
                List.generate(
                    Controller2.lessonsList.length,
                    (index) => buildDropdownMenuItems(
                        Controller2.lessonsList[index]))),
            buildSizedBox(),
            Row(
              children: [
                Expanded(
                  child: buildDropDownContainer(
                      widget.oAnkiPhotoCard.selectedTopic,
                      List.generate(
                          Controller2.topicList.length,
                          (index) => buildDropdownMenuItems(
                              Controller2.topicList[index]))),
                ),
                buildSizedBoxWidth(),
                Expanded(
                  child: buildDropDownContainer(
                      widget.oAnkiPhotoCard.selectedSubtopic,
                      List.generate(
                          Controller2.subTopicList.length,
                          (index) => buildDropdownMenuItems(
                              Controller2.subTopicList[index]))),
                ),
              ],
            ),
            buildSizedBox(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(246, 250, 253, 1),
                    borderRadius: BorderRadius.circular(12)),
                child: ListView.builder(
                  itemCount: widget.oAnkiPhotoCard.tags.length,
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
                                  widget.oAnkiPhotoCard.tags[index],
                                  style: TextStyle(
                                      color: const Color.fromRGBO(9, 44, 76, 1),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                        index < widget.oAnkiPhotoCard.tags.length - 1
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
  }

  Container buildDropDownContainer(
      String val, List<DropdownMenuItem<String>> items) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(126, 146, 162, 0.2)),
          color: const Color.fromRGBO(246, 250, 253, 1),
          borderRadius: BorderRadius.circular(12)),
      child: _BuildDropDownMenu(val: val, items: items),
    );
  }

  DropdownMenuItem<String> buildDropdownMenuItems(String itemValue) {
    return DropdownMenuItem(
        value: itemValue,
        child: Row(
          children: [
            Text(
              itemValue,
              style: TextStyle(
                  color: const Color.fromRGBO(0, 73, 88, 1),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ));
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

  buildSizedBoxWidth() => SizedBox(
        width: 7.w,
      );
  buildSizedBox() => SizedBox(
        height: 5.w,
      );
}

class _BuildDropDownMenu extends StatefulWidget {
  final String val;
  final List<DropdownMenuItem<String>> items;

  const _BuildDropDownMenu({Key? key, required this.val, required this.items})
      : super(key: key);

  @override
  State<_BuildDropDownMenu> createState() => _BuildDropDownMenuState();
}

class _BuildDropDownMenuState extends State<_BuildDropDownMenu> {
  late String def;
  @override
  void initState() {
    super.initState();
    def = widget.val;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        underline: const SizedBox(),
        value: def,
        style: const TextStyle(color: Colors.black),
        onChanged: (value) {
          def = value!;
          setState(() {});
        },
        items: widget.items);
  }
}
