import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../constansts/icon_constants/icon_constants.dart';
import '../constansts/widget_const/widget_const.dart';
import '../controller/controller.dart';

class TagSearch extends StatefulWidget {
  const TagSearch({Key? key}) : super(key: key);

  @override
  State<TagSearch> createState() => _TagSearchState();
}

class _TagSearchState extends State<TagSearch> {
  var onTab = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 330.w,
          height: 50.h,
          child: TextFormField(
            onTap: () {
              onTab = false;

              setState(() {});
            },
            style: const TextStyle(
              color: Color.fromRGBO(9, 44, 76, 1),
            ),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              label: Text(
                WidgetConst.addNewTag,
                style: TextStyle(
                  color: const Color.fromRGBO(126, 146, 162, 1),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: onTab
                  ? Image(
                      image: Svg(IconConst.searchIcon, size: Size(32.h, 32.h)),
                    )
                  : IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: const Color.fromRGBO(126, 146, 162, 1),
                        size: 25.h,
                      ),
                    ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    color: const Color.fromRGBO(234, 238, 244, 1),
                    height: 1,
                    width: double.maxFinite,
                  ),
                  ListTile(
                      onTap: () {},
                      title: Text(
                        Controller2.tagsList[index],
                        style: TextStyle(
                            color: const Color.fromRGBO(9, 44, 76, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp),
                      ),
                      leading: Image(
                        image: Svg(
                            "assets/images/icons/homepage_icons/popUpTagIcon.svg",
                            size: Size(20.w, 20.h)),
                      ),
                      trailing: Image(
                          image: Svg(
                              "assets/images/icons/my_pdf_icon/close_circleX.svg",
                              size: Size(20.w, 20.w)))),
                ],
              );
            },
            itemCount: Controller2.tagsList.length,
          ),
        )
      ],
    );
  }
}
