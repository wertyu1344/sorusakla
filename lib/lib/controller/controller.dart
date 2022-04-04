import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled1/constansts/controller/controller.dart';
import 'package:untitled1/widgets/select_photo_card/photo_picker_card.dart';

import '../widgets/listview_photo-listview-card/folder_card.dart';
import '../widgets/listview_photo-listview-card/photo_card.dart';
import '../widgets/listview_photo-listview-card/tag_card.dart';

class Controller with ChangeNotifier {
  void showDeaultTagsChange(widgetValue, val) {
    widgetValue = val;

    notifyListeners();
  }

  var yourBoolVar = false;
  bool toggleBoolValue() {
    yourBoolVar = !yourBoolVar;

    notifyListeners();

    return yourBoolVar;
  }

  static bool? editBool = false;
  var allPhotoSelect = false;
  var listOrSplit = true;

  int allPhotoListLength = 0;

  normalSplitType() {
    listOrSplit = true;
    notifyListeners();
  }

  void changeSplitType() {
    listOrSplit = !listOrSplit;
    notifyListeners();
  }

  void selectAll() {
    if (allPhotoSelect == false) {
      for (var element in photoListt) {
        element.selected.value == false ? allPhotoListLength++ : null;
        element.selected.value = true;
      }
      allPhotoSelect = true;
    } else if (allPhotoSelect == true) {
      for (var element in photoListt) {
        element.selected.value == true ? allPhotoListLength-- : null;
        element.selected.value = false;
      }
      allPhotoSelect = false;
    }

    notifyListeners();
  }

  void increaselistLength() {
    allPhotoListLength++;
    notifyListeners();
  }

  void miniusListLength() {
    allPhotoListLength--;
    notifyListeners();
  }

  static List<Widget> TestList = [];

  List<PhotoPickerCard> photoListt = [
    PhotoPickerCard(ValueNotifier(false)),
    PhotoPickerCard(ValueNotifier(false)),
    PhotoPickerCard(ValueNotifier(false)),
    PhotoPickerCard(ValueNotifier(false)),
    PhotoPickerCard(ValueNotifier(false)),
    PhotoPickerCard(ValueNotifier(false)),
    PhotoPickerCard(ValueNotifier(false)),
    PhotoPickerCard(ValueNotifier(false)),
    PhotoPickerCard(ValueNotifier(false)),
  ];

  static List<FolderCard> folderList = [
    FolderCard(
      numberOfPhoto: 2,
      createDate: DateTime(2003),
      title: "z",
      noSplit: false,
      index: 1,
    ),
    FolderCard(
      numberOfPhoto: 3,
      createDate: DateTime(2009),
      title: "b",
      noSplit: false,
      index: 2,
    ),
    FolderCard(
      numberOfPhoto: 4,
      createDate: DateTime(2002),
      title: "c",
      noSplit: false,
      index: 3,
    ),
  ];

  static List<TagCard> tagList = [
    TagCard(title: 'Tag12', split: true, index: 1),
    TagCard(title: 'Tag122', split: true, index: 1),
    TagCard(title: 'Tag1122', split: true, index: 1),
    TagCard(title: 'Tag132', split: true, index: 1),
    TagCard(title: 'Tag1232', split: true, index: 1),
  ];

  static List<PhotoCard> photoList = List.generate(
    10,
    (index) => PhotoCard(
      answer: index == 0
          ? "A"
          : index == 1
              ? "B"
              : index == 2
                  ? "C"
                  : index == 3
                      ? "D"
                      : "E",
      title: "${ControllerConst.docTitle} 23-11-2020 12:20:42 PM ($index)",
      selectedLesson: "${ControllerConst.lesson}-$index",
      selectedSubtopic: "Subtopic-$index",
      selectedTopic: "Topic-$index",
      index: index,
      imagePath: "imagePath",
      subtitle: "23-11-2020 12:20 $index",
      tags: List.generate(index, (index) => "${ControllerConst.tag}-$index"),
    ),
  );

  var today = DateTime.now();

  DateTime selectedStartDate = DateTime.now();
  DateTime selectedFinishDate = DateTime.now();

  Future<void> selectStartDate(BuildContext context) async {
    DateTime firstYear = DateTime(1922);
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedStartDate,
        firstDate: firstYear,
        lastDate: today);
    if (picked != null && picked != selectedStartDate) {
      selectedStartDate = picked;

      notifyListeners();
    }
  }

  String folderTitle = "";
  String tagTitle = "";

  tagTitleChange(title) {
    tagTitle = title;
    print("tag title $tagTitle");
    notifyListeners();
  }

  folderTitleChange(title) {
    folderTitle = title;
    notifyListeners();
  }

  Future<void> selectFinishDate(BuildContext context) async {
    DateTime firstYear = DateTime(1922);
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedFinishDate,
        firstDate: firstYear,
        lastDate: today);
    if (picked != null && picked != selectedFinishDate) {
      selectedFinishDate = picked;

      notifyListeners();
    }
  }

  List<FolderClass> homePageFolders = [
    FolderClass(
        title: "AFodler1",
        createTime: DateTime(2027, 13, 3, 22),
        numberOfPhoto: 0),
    FolderClass(
        title: "cFodler2",
        createTime: DateTime(2022, 13, 3, 20, 00),
        numberOfPhoto: 2),
    FolderClass(
        title: "BFodler3", createTime: DateTime(2022, 13, 3), numberOfPhoto: 5),
    FolderClass(
        title: "dFodler4", createTime: DateTime(2022, 13, 3), numberOfPhoto: 9),
  ];

  sortByAlphabetHomePage() {
    homePageFolders.sort((a, b) => a.title.compareTo(b.title));

    (homePageFolders.forEach((element) {
      print(element.title);
    }));
    notifyListeners();
  }

  sortByAlphabetAtoZHomeInFolderForFolder(List<FolderCard> list) {
    list.sort((a, b) => a.title.compareTo(b.title));

    notifyListeners();
  }

  sortByAlphabetAtoZHomeInFolderForPhoto(List<PhotoCard> list) {
    list.sort((a, b) => a.title.compareTo(b.title));

    notifyListeners();
  }

  sortByAlphabetZtAZHomeInFolderForPhoto(List<PhotoCard> list) {
    list.sort((a, b) => b.title.compareTo(a.title));

    notifyListeners();
  }

  sortByDateTimeHomePage() {
    homePageFolders.sort((a, b) => a.createTime.compareTo(b.createTime));

    (homePageFolders.forEach((element) {
      print(element.createTime);
    }));
    notifyListeners();
  }

  sortByPhotoNumberMostToLessHomePage() {
    homePageFolders.sort((a, b) => b.numberOfPhoto.compareTo(a.numberOfPhoto));

    notifyListeners();
  }

  sortByPhotoNumberLessToMostHomePage() {
    homePageFolders.sort((a, b) => a.numberOfPhoto.compareTo(b.numberOfPhoto));

    notifyListeners();
  }
}

class Controller2 {
  static bool localStorage = false;
  static bool showDefaultTags = true;
  static var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');

  static routeTo(Widget page, context) {
    return Navigator.push(
      context,
      PageTransition(child: page, type: PageTransitionType.leftToRight),
    );
  }

  static goBack(context) {
    Navigator.of(context).pop();
  }

  static dialogShow(Widget page, context) {
    showDialog(
        barrierLabel: "adsf",
        context: context,
        builder: (BuildContext context) {
          return page;
        });
  }

  static var subTopicList = List.generate(10, (index) => "Subtopic-$index");
  static var topicList = List.generate(10, (index) => "Topic-$index");
  static var lessonsList = List.generate(10, (index) => "Lesson-$index");
  static var tagsList = List.generate(10, (index) => "Tag-$index");
}

class FolderClass {
  String title;
  DateTime createTime;
  List<FolderClass> content;
  int numberOfPhoto = 0;
  FolderClass(
      {this.content = const [],
      required this.title,
      required this.createTime,
      required this.numberOfPhoto});
}
