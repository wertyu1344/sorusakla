import 'package:flutter/material.dart';
import 'package:untitled1/constansts/onboard_login_register/register_page_constansts.dart';

class MyTextFieldWidget extends StatelessWidget {
  final String hintText, titleText;
  const MyTextFieldWidget(
      {required this.hintText, required this.titleText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: TextFormField(
        style: RegisterPageConstansts.textFieldHintStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: RegisterPageConstansts.textFieldHintStyle,
          labelText: titleText,
          labelStyle: RegisterPageConstansts.textFieldLabelStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
