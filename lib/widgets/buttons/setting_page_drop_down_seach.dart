import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/constansts/setting_page/setting_page.dart';
import 'package:untitled1/controller/controller.dart';

class SettingDropdownSearchWidget extends StatefulWidget {
  final Function callBackMyValue;
  final String hintText, labelText, selectedItem;
  final List<String>? items;
  const SettingDropdownSearchWidget(
      {required this.callBackMyValue,
      required this.hintText,
      required this.labelText,
      required this.items,
      required this.selectedItem,
      Key? key})
      : super(key: key);

  @override
  _SettingDropdownSearchWidget createState() => _SettingDropdownSearchWidget();
}

class _SettingDropdownSearchWidget extends State<SettingDropdownSearchWidget> {
  late String _selectedItem = widget.hintText;
  @override
  Widget build(BuildContext context) {
    print(Controller.editBool);
    return DropdownSearch<String>(
      enabled: Controller.editBool!,
      showAsSuffixIcons: true,
      dropDownButton: Icon(
        Controller.editBool != true ? null : Icons.keyboard_arrow_down_sharp,
        color: SettingConst.settingPageGeneralBlack,
        size: Controller.editBool != true ? 0 : null,
      ),
      dropdownSearchDecoration: InputDecoration(
        labelText: widget.labelText,
        hintText: _selectedItem,
        floatingLabelStyle: Controller.editBool! == false
            ? SettingConst.textFieldLabelStyleDisable
            : SettingConst.textFieldLabelStyle,
        hintStyle: SettingConst.textFieldHintStyleDisable,
        labelStyle: Controller.editBool! == false
            ? SettingConst.textFieldLabelStyleDisable
            : const TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.black)),
      ),
      showSearchBox: true,
      mode: Mode.BOTTOM_SHEET,
      items: widget.items,
      onChanged: (value) {
        _selectedItem = value!;
        widget.callBackMyValue(_selectedItem);
      },
    );
  }
}
