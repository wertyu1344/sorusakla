import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:untitled1/pages/pdf_page/pdf_page.dart';
import 'package:untitled1/pages/pdf_page/pdf_template.dart';
import 'package:untitled1/widgets/app_bar_widget/app_bar_widget.dart';

import '../../constansts/icon_constants/icon_constants.dart';
import '../../controller/controller.dart';

class PdfViewPage extends StatelessWidget {
  const PdfViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          MyAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => Controller2.routeTo(PdfPage(), context),
                  child: SizedBox(
                    width: 44.w,
                    height: 44.w,
                    child: const Center(
                      child: Icon(Icons.arrow_back_ios_outlined),
                    ),
                  ),
                ),
                Text(
                  "Doc 23-11-2020 12:20:42 PM (2)",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () => Controller2.routeTo(PdfTemplate(), context),
                  child: Image(
                      image:
                          Svg(IconConst.pdfShareIcon, size: Size(24.w, 24.w))),
                )
              ],
            ),
          ),
          Image.asset(IconConst.pdfExample),
        ],
      ),
    ));
  }
}
