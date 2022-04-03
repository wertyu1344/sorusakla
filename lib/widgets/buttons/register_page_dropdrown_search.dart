import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../constansts/onboard_login_register/register_page_constansts.dart';

class RegisterDropdownSearchWidget extends StatefulWidget {
  final Function callBackMyValue;
  final String hintText, labelText, selectedItem;
  final List<String>? items;
  const RegisterDropdownSearchWidget(
      {required this.callBackMyValue,
      required this.hintText,
      required this.labelText,
      required this.items,
      required this.selectedItem,
      Key? key})
      : super(key: key);

  @override
  _DropdownSearchState createState() => _DropdownSearchState();
}

class _DropdownSearchState extends State<RegisterDropdownSearchWidget> {
  late String _selectedItem = widget.hintText;
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupBackgroundColor: const Color.fromARGB(255, 15, 227, 167),
      dropDownButton: const Icon(
        Icons.keyboard_arrow_down_sharp,
        color: Colors.white,
      ),
      showAsSuffixIcons: true,
      dropdownSearchDecoration: InputDecoration(
        labelText: widget.labelText,
        hintText: _selectedItem,
        floatingLabelStyle: RegisterPageConstansts.textFieldLabelStyle,
        hintStyle: RegisterPageConstansts.textFieldHintStyle,
        labelStyle: RegisterPageConstansts.textFieldLabelStyle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
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
