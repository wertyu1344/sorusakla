import 'package:flutter/material.dart';
import 'package:untitled1/constansts/setting_page/setting_page.dart';

class SettingScreenTextFieldWidget extends StatelessWidget {
  final String hintText, titleText;
  final bool? editle;
  SettingScreenTextFieldWidget(
      {required this.hintText, required this.titleText, this.editle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: TextFormField(
        enabled: editle,
        style: SettingConst.textFieldHintStyle,
        decoration: InputDecoration(
          disabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          hintText: hintText,
          hintStyle: editle == false
              ? SettingConst.textFieldHintStyleDisable
              : SettingConst.textFieldHintStyle,
          labelText: titleText,
          labelStyle: editle == false
              ? SettingConst.textFieldLabelStyleDisable
              : SettingConst.textFieldLabelStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
        ),
      ),
    );
  }
}
