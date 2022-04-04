import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../constansts/widget_const/widget_const.dart';
import '../../controller/controller.dart';
import '../TagSearch.dart';

class Tags extends StatefulWidget {
  Tags({Key? key}) : super(key: key);

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  List tags = Controller2.tagsList;

  var onTab = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(234, 238, 244, 0.6),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: 350.w,
        height: 418.h,
        child: Column(
          children: [
            SizedBox(
              width: 330.w,
              height: 50.h,
              child: TagSearch(),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
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
              ),
            ),
            InkWell(
              onTap: () {
                Controller2.goBack(context);
              },
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 81, 78, 243),
                    borderRadius: BorderRadius.circular(70)),
                child: Center(
                  child: Text(
                    WidgetConst.SAVE,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
