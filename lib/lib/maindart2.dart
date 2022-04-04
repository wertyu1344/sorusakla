import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Asd extends StatelessWidget {
  const Asd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          ListViewCard(
            title: "Doc title 23-11-2020 12:20:42 PM (2)",
            subtitle: "23-11-2020 12:20",
            tagsNames: ["tag-1", "tag-2"],
            imagePath: "assets/images/icons/homepage_icons/pdf_overview.svg",
          ),
        ],
      ),
    );
  }
}

class ListViewCard extends StatelessWidget {
  final String imagePath, subtitle, title;
  final List<String> tagsNames;
  const ListViewCard({
    Key? key,
    required this.imagePath,
    required this.subtitle,
    required this.tagsNames,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        color: Color.fromRGBO(243, 247, 253, 1),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(color: Colors.white70, blurRadius: 2)
                  ], borderRadius: BorderRadius.circular(3)),
                  alignment: Alignment.center,
                  child: Image(
                    image: Svg(imagePath),
                  ),
                )),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        title,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Color.fromRGBO(73, 73, 73, 1)),
                        textAlign: TextAlign.start,
                      ),
                      subtitle: Text(
                        subtitle,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(39, 38, 67, 0.5),
                          fontSize: 12.sp,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu_rounded),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return bringCardItems(tagsNames[index]);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: tagsNames.length,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Container bringCardItems(String tagName) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset.fromDirection(1, 1),
          ),
        ]),
    child: Text(
      tagName,
      style: GoogleFonts.roboto(
          color: const Color.fromRGBO(0, 73, 88, 1),
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 12.sp),
    ),
  );
}
