import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class BottomButton extends StatelessWidget {
  final String selected;
  final List itemList;
  const BottomButton({Key? key, required this.selected, required this.itemList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(13))),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.vertical(top: Radius.circular(13))),
            height: 50.h,
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(4.h),
                    alignment: Alignment.topLeft,
                    height: double.maxFinite,
                    child: Image(
                      image: Svg(
                          "assets/images/icons/capture_paper/close_circle.svg",
                          size: Size(20.w, 20.w)),
                    )),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      label: Text(
                        "    Search Lesson",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Image(
                        image: Svg(
                            "assets/images/icons/capture_paper/search_icon.svg",
                            size: Size(22.h, 22.h)),
                      ),
                    ),
                  ),
                ),
              ],
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
                          "  " + itemList[index],
                          style: TextStyle(
                              color: const Color.fromRGBO(9, 44, 76, 1),
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp),
                        ),
                        trailing: Image(
                            image: Svg(
                                "assets/images/icons/my_pdf_icon/close_circleX.svg",
                                size: Size(20.w, 20.w)))),
                  ],
                );
              },
              itemCount: itemList.length,
            ),
          )
        ],
      ),
    );
  }
}
