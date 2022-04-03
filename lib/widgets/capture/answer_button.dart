import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerButton extends StatefulWidget {
  final String value;
  final Function onSelectedButton;
  final String selectedButton;
  AnswerButton(
      {required this.selectedButton,
      required this.onSelectedButton,
      required this.value,
      Key? key})
      : super(key: key);

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {});
        widget.onSelectedButton(widget.value);
        widget.value;
      },
      icon: Container(
        alignment: Alignment.center,
        width: 32.w,
        height: 32.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.value == widget.selectedButton
              ? Color.fromRGBO(245, 155, 66, 1)
              : Colors.white,
          border: Border.all(
              style: BorderStyle.solid,
              color: widget.value == widget.selectedButton
                  ? Colors.white
                  : Color.fromRGBO(245, 155, 66, 1)),
        ),
        child: Center(
          child: Text(
            widget.value,
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14.sp,
                color: widget.value == widget.selectedButton
                    ? Colors.white
                    : Color.fromRGBO(245, 155, 66, 1)),
          ),
        ),
      ),
    );
  }
}
