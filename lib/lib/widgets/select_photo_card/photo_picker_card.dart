import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';

import '../../constansts/icon_constants/icon_constants.dart';
import '../../controller/controller.dart';

class PhotoPickerCard extends StatelessWidget {
  ValueNotifier<bool> selected;
  PhotoPickerCard(this.selected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, _) => Stack(
        children: [
          InkWell(
            onTap: () {
              if (selected.value == true) {
                selected.value = false;
              } else if (selected.value == false) {
                selected.value = true;
              }

              selected.value == true
                  ? Provider.of<Controller>(context, listen: false)
                      .increaselistLength()
                  : Provider.of<Controller>(context, listen: false)
                      .miniusListLength();
            },
            child: Container(
              color: Colors.white,
              width: 90.48.w,
              height: 87.44.h,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Image(
                      image: Svg(
                          selected.value == true
                              ? IconConst.pdfPhotoPickCheckTrue
                              : IconConst.pdfPhotoPickCheckFalse,
                          size: Size(21.08.w, 20.97.w))),
                ),
              ),
            ),
          ),
        ],
      ),
      valueListenable: selected,
    );
  }
}
