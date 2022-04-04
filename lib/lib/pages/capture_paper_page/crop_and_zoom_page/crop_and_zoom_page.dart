import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/widgets/color/filters.dart';

import '../../../change_colors.dart';
import '../../../constansts/capture_page/capture_page.dart';
import '../../../constansts/icon_constants/icon_constants.dart';
import '../../../controller/controller.dart';
import '../../../widgets/capture/add_tag_pop.dart';
import '../../../widgets/capture/answer_button.dart';
import '../../../widgets/capture/bottom_butons.dart';
import '../../../widgets/capture/exam_butons.dart';
import '../../../widgets/capture/lesson_buttons.dart';
import '../../home_page/home_page/home_page.dart';

class CropAndZoomPage extends StatefulWidget {
  const CropAndZoomPage({Key? key}) : super(key: key);

  @override
  State<CropAndZoomPage> createState() => _CropAndZoomPageState();
}

class _CropAndZoomPageState extends State<CropAndZoomPage> {
  double brightness = 0;
  double saturation = 0;
  double _contrastSliderValue = 0;
  double _brightnessSliderValue = 0;
  int _selectedFilter = 0;
  int _pastSelectedIndex = 0;
  int _selectedIndex = 0;
  int rotate = 0;
  String selectedButton = "A";
  String selectedExam = "Exam-1";
  String selectedLesson = "Lesson-1";
  String selectedTopic = "Topic-1";
  String selectedSubtopic = "Subtopic";
  var exams = List.generate(10, (index) => "Exam-$index");
  bool check = true;
  var imageIndex = 0;
  List imageList = ["assets/woman.jpg", "assets/test.jpg"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: buildBottomNavigationBar(),
        backgroundColor: const Color.fromRGBO(39, 38, 67, 1),
        body: Column(
          children: [
            //App Bar
            buildAppBar(context),
            //Body
            buildBody(),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image(
              image: Svg(
            _selectedIndex == 0
                ? IconConst.botNavBarTagOnTap
                : IconConst.botNavBarTag,
            size: Size(24.w, 24.w),
          )),
          label: CaptureConst.tag,
        ),
        BottomNavigationBarItem(
          icon: Image(
              image: Svg(
            _selectedIndex == 1
                ? IconConst.botNavBarFilterOnTap
                : IconConst.botNavBarFilter,
            size: Size(24.w, 24.w),
          )),
          label: CaptureConst.filter,
        ),
        BottomNavigationBarItem(
          icon: const Icon(FontAwesomeIcons.sliders),
          label: CaptureConst.adjust,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.rotate_right),
          label: CaptureConst.rotate,
        ),
      ],
      currentIndex: _selectedIndex == 3
          ? _selectedIndex = _pastSelectedIndex
          : _selectedIndex,
      showUnselectedLabels: true,
      selectedItemColor: const Color.fromRGBO(81, 78, 243, 1),
      unselectedItemColor: const Color.fromRGBO(0, 73, 88, 1),
      onTap: _onItemTapped,
      unselectedLabelStyle:
          const TextStyle(color: Color.fromRGBO(0, 73, 88, 1)),
      selectedLabelStyle: const TextStyle(color: Color.fromRGBO(0, 73, 88, 1)),
      iconSize: 24.w,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _pastSelectedIndex = _selectedIndex;
      _selectedIndex = index;
      _selectedIndex == 3 ? {rotate < 3 ? rotate++ : rotate = 0} : null;
    });
  }

  Expanded buildBody() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Dash Line
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 24.0.w, right: 24.w),
              child: Column(
                children: [
                  Center(
                    child: TextFormField(
                      initialValue: "Doc 23-11-2020 16:12:42 PM (3)",
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Doc 23-11-2020 16:12:42 PM (3)",
                          hintStyle: TextStyle(color: Colors.white)),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    children: List.generate(
                        150 ~/ 2,
                        (index) => Expanded(
                              child: Container(
                                color: index % 2 == 0
                                    ? Colors.transparent
                                    : const Color.fromRGBO(255, 255, 255, 1),
                                height: 2,
                              ),
                            )),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  //Photo
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: rotate,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.matrix(
                            filtre.values.elementAt(_selectedFilter)),
                        child: ChangeColors(
                          brightness: brightness,
                          saturation: saturation,
                          child: Image.asset(
                            imageList[imageIndex],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Trash
                      IconButton(
                          onPressed: () {
                            Controller2.dialogShow(
                                deletePhotoDialog(context), context);
                          },
                          icon: const CircleAvatar(
                              backgroundColor: Color.fromRGBO(81, 78, 243, 1),
                              child: Icon(
                                FontAwesomeIcons.trashCan,
                                size: 17,
                                color: Colors.white,
                              ))),
                      Row(
                        children: [
                          InkWell(
                              customBorder: const CircleBorder(),
                              onTap: () {
                                setState(() {
                                  imageIndex > 0 ? imageIndex-- : null;
                                });
                              },
                              child: Container(
                                  width: 42.w,
                                  height: 42.w,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_back_sharp,
                                      color:
                                          const Color.fromRGBO(39, 38, 67, 1),
                                      size: 21.sp,
                                    ),
                                  ))),
                          SizedBox(width: 10.w),
                          Container(
                            color: Colors.white,
                            width: 31.w,
                            height: 24.h,
                            child: Center(
                              child: Text(
                                "${imageIndex + 1}/${imageList.length}",
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: Colors.green,
                              onTap: () {
                                setState(() {
                                  imageIndex < imageList.length - 1
                                      ? imageIndex++
                                      : null;
                                });
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 42.w,
                                  height: 42.w,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.arrow_forward_sharp,
                                    color: const Color.fromRGBO(39, 38, 67, 1),
                                    size: 21.sp,
                                  ))),
                        ],
                      ),
                      //Confirm
                      IconButton(
                        onPressed: () {
                          setState(() {
                            check = !check;
                          });
                        },
                        icon: CircleAvatar(
                          backgroundColor: const Color.fromRGBO(81, 78, 243, 1),
                          child: check == true
                              ? const Icon(
                                  FontAwesomeIcons.check,
                                  size: 17,
                                  color: Colors.white,
                                )
                              : Image(
                                  image: Svg(IconConst.check2,
                                      size: Size(17.w, 17.w)),
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 15.h),
          Padding(
            padding: _selectedIndex != 1
                ? EdgeInsets.only(left: 24.0.w, right: 24.w)
                : const EdgeInsets.only(),
            child: SizedBox(
              width: 400.w,
              height: 190.h,
              child: _selectedIndex == 0
                  ? buildTag()
                  : Center(
                      child: _selectedIndex == 1
                          ? buildFilter(context)
                          : _selectedIndex == 2
                              ? buildAdjust()
                              : const SizedBox(),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildTag() {
    return Column(children: [
      Column(children: [
        Row(children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              width: 44.w,
              height: 44.h,
              child: Column(
                children: [
                  // Add Tag
                  Flexible(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Tags();
                            });
                      },
                      icon: Image(
                        image: Svg(
                            "assets/images/icons/capture_paper/add_tag.svg",
                            size: Size(25.w, 25.w)),
                      ),
                    ),
                  ),
                  Text(CaptureConst.addTag,
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(81, 78, 243, 1)))
                ],
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(81, 78, 243, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: ["A", "B", "C", "D", "E"]
                              .map(
                                (e) => AnswerButton(
                                  value: e,
                                  selectedButton: selectedButton,
                                  onSelectedButton: (value) {
                                    setState(() {
                                      selectedButton = value!;
                                    });
                                  },
                                ),
                              )
                              .toList()))))
        ]),
        buildSizeBox(0, 8.h),
        SizedBox(
          height: 48.h,
          child: Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Container(
              color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: SizedBox(
                          width: 156.w,
                          child: ExamButon(
                            value: exams[index],
                            selectedExam: selectedExam,
                            examCallBack: (exam) {
                              setState(() {});
                              selectedExam = exam;
                            },
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  );
                },
                itemCount: exams.length,
              ),
            ),
          ),
        ),
        buildSizeBox(0, 8.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [selectedLesson, selectedTopic, selectedSubtopic]
              .map((e) => Expanded(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              var itemList = e == selectedLesson
                                  ? Controller2.lessonsList
                                  : e == selectedTopic
                                      ? Controller2.topicList
                                      : Controller2.subTopicList;
                              return BottomButton(
                                selected: e,
                                itemList: itemList as List<dynamic>,
                              );
                            },
                            context: context);
                        /* showDialog(
                            context: context,
                            builder: (context) {
                              var itemList = e == selectedLesson
                                  ? Controller2.lessonsList
                                  : e == selectedTopic
                                      ? Controller2.topicList
                                      : Controller2.subTopicList;
                              return BottomButton(
                                selected: e,
                                itemList: itemList as List<dynamic>,
                              );
                            });*/
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: Container(
                          height: 48.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(e),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        )
      ])
    ]);
  }

  Expanded buildBottomDropDownButton(String title, List itemList) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(right: 8.0.w),
      child: LessonButtons(title: title, itemList: itemList),
    ));
  }

  SizedBox buildFilter(context) {
    return SizedBox(
      height: 100.w,
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: filtre.keys.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              index == 0 ? SizedBox(width: 30.w) : const SizedBox(),
              buildFilterCard(index),
              const SizedBox(width: 5),
              index == filtre.keys.length - 1
                  ? SizedBox(
                      width: 30.w,
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }

  InkWell buildFilterCard(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedFilter = index;
        });
      },
      child: Container(
        color: const Color.fromRGBO(81, 78, 243, 1),
        width: 100.w,
        height: 900.h,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: _selectedFilter == index
                    ? const EdgeInsets.only(left: 1.0, right: 1, top: 1)
                    : const EdgeInsets.only(),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Container(
                    color: Colors.green,
                    child: ColorFiltered(
                        colorFilter:
                            ColorFilter.matrix(filtre.values.elementAt(index)),
                        child: Image.asset(
                          imageList[imageIndex],
                          fit: BoxFit.cover,
                        )),
                    // this container won't be larger than
                    // half of its parent size
                  ),
                ),
              ),
            ),
            Container(
              color: index == _selectedFilter
                  ? const Color.fromRGBO(81, 78, 243, 1)
                  : Colors.black,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    filtre.keys.elementAt(index),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Map<String, List<double>> filtre = {
    "Original": Filters.normal,
    "Grey": Filters.grey,
    "B&V": Filters.blackAndWhite,
  };

  Column buildAdjust() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Image(
              image: Svg(
                IconConst.brightness,
                size: Size(35.w, 35.w),
              ),
            ),
            Expanded(
              child: Slider(
                activeColor: const Color.fromRGBO(81, 78, 243, 1),
                inactiveColor: const Color.fromRGBO(239, 239, 239, 1),
                value: _brightnessSliderValue,
                max: 100,
                min: -100,
                label: _brightnessSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _brightnessSliderValue = value;
                    brightness = (_brightnessSliderValue.toInt() / 100);
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Image(
              image: Svg(IconConst.contrast, size: Size(35.w, 35.w)),
            ),
            Expanded(
              child: Slider(
                activeColor: const Color.fromRGBO(81, 78, 243, 1),
                inactiveColor: const Color.fromRGBO(239, 239, 239, 1),
                value: _contrastSliderValue,
                max: 100,
                min: -100,
                label: _contrastSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _contrastSliderValue = value;
                    saturation = _contrastSliderValue / 100;
                  });
                },
              ),
            ),
          ],
        ),
        buildSizeBox(0, 45.h),
      ],
    );
  }

  SizedBox buildAppBar(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 72.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.h),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            Expanded(
                child: Center(
                    child: Text(
              CaptureConst.editPage,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ))),
            IconButton(
              onPressed: () {
                Controller2.routeTo(HomePage(), context);
              },
              icon: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  buildSizeBox([double w = 0, double h = 0]) {
    return SizedBox(width: w, height: h);
  }

  Dialog deletePhotoDialog(BuildContext context) {
    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Center(
          child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {
                setState(() {});
              },
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                width: 314.w,
                height: 144.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Top Side
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Color.fromARGB(255, 252, 28, 28),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              CaptureConst.delete,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),

                    //Mid
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        CaptureConst.deleteDialog,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                    ),
                    //Buttons
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //Cancel Button
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Text(
                                      CaptureConst.cancel,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.sp,
                                          color: Colors.black),
                                    )),
                              ),
                            ),
                            const VerticalDivider(
                              width: 1,
                            ),
                            //Create Button
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Text(
                                      CaptureConst.yes,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.sp,
                                          color: Colors.black),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
