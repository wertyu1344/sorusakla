import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class LessonButtons extends StatefulWidget {
  String title;
  List itemList;
  LessonButtons({Key? key, required this.itemList, required this.title})
      : super(key: key);

  @override
  State<LessonButtons> createState() => _LessonButtonsState();
}

class _LessonButtonsState extends State<LessonButtons> {
  late String def;

  @override
  void initState() {
    super.initState();
    def = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(126, 146, 162, 0.2)),
          color: Color.fromRGBO(246, 250, 253, 1),
          borderRadius: BorderRadius.circular(8)),
      child: DropdownButton<String>(
          icon: Image(
            image: Svg(
                "assets/images/icons/capture_paper/arrow_lesson_button.svg",
                size: Size(7.w, 4.h)),
          ),
          underline: const SizedBox(),
          style: TextStyle(
              color: Color.fromRGBO(9, 44, 76, 1),
              fontWeight: FontWeight.w500,
              fontSize: 10.sp),
          value: def,
          items: widget.itemList.map((e) => buildDropdownMenuItem(e)).toList(),
          onChanged: (value) {
            def = value!;

            setState(() {});
          }),
    );
  }

  DropdownMenuItem<String> buildDropdownMenuItem(String title) =>
      DropdownMenuItem(
        child: Text(title),
        value: title,
      );
}
