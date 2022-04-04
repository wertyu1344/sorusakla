import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamButon extends StatefulWidget {
  final String value;
  final String selectedExam;
  final Function examCallBack;
  const ExamButon(
      {required this.value,
      Key? key,
      required this.selectedExam,
      required this.examCallBack})
      : super(key: key);

  @override
  State<ExamButon> createState() => _ExamButonState();
}

class _ExamButonState extends State<ExamButon> {
  @override
  Widget build(BuildContext context) {
    bool selected = widget.selectedExam == widget.value;
    return InkWell(
      onTap: () {
        widget.examCallBack(widget.value);
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                selected ? const Color.fromRGBO(81, 78, 243, 1) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: selected ? Colors.white60 : Colors.white)),
        height: 40.h,
        alignment: Alignment.center,
        child: Text(
          widget.value,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
