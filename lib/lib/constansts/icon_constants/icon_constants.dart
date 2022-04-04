import 'package:flutter/material.dart';

class IconConst {
  static String folderIcon = "assets/images/icons/homepage_icons/folder.svg";
  static String splitViewIcon =
      "assets/images/icons/homepage_icons/split_view_icon.svg";
  static String listViewIcon =
      "assets/images/icons/homepage_icons/list_view_icon.svg";
  static String buypro = "assets/images/icons/homepage_icons/buypro.svg";
  static String folderIconTop =
      "assets/images/icons/homepage_icons/folder_top.svg";
  static String listIcon = "assets/images/icons/homepage_icons/list.svg";
  static String menuIcon = "assets/images/icons/homepage_icons/menu.svg";
  static String searchIcon = "assets/images/icons/homepage_icons/search.svg";
  static String smallSIcon =
      "assets/images/icons/homepage_icons/smallSIcon.svg";
  static String drawerSoruSakla =
      "assets/images/icons/homepage_icons/drawer_sorusakla.svg";

  static String sIcon = "assets/sIcon.png";
  static String searchbarIcon = "/images/icons/homepage_icons/searchbar.svg";
  static String settingsBackArrowIcon =
      "assets/images/icons/settings_icons/back_arrow.svg";
  static String editFinishIcon =
      "assets/images/icons/settings_icons/edit_finish_icon.svg";
  static String editIcon = "assets/images/icons/settings_icons/edit.svg";

  //List Tile Icons
  static String delete = "assets/images/icons/homepage_icons/delete.svg";
  static String rename = "assets/images/icons/homepage_icons/rename.svg";

  //Drawer Icons
  static String drawerHome =
      "assets/images/icons/drawer_icons/drawer_home_icon.svg";
  static String drawerPdf =
      "assets/images/icons/drawer_icons/drawer_pdf_icon.svg";
  static String drawerSetting =
      "assets/images/icons/drawer_icons/drawer_setting_icon.svg";
  static String drawerTag =
      "assets/images/icons/drawer_icons/drawer_tag_icon.svg";

  //Floating Action Button
  static String floatingHomeOff =
      "assets/images/icons/floating_button_icons/homepage_off.svg";
  static String floatingHomeOn =
      "assets/images/icons/floating_button_icons/homepage_on.svg";
  static String floatingHomeCamera =
      "assets/images/icons/floating_button_icons/camera.svg";
  static String floatingHomeFolder =
      "assets/images/icons/floating_button_icons/folder.svg";
  static String floatingHomeFolderAdd =
      "assets/images/icons/floating_button_icons/folder_add.svg";

  static BoxDecoration floatingBackgroundColor = BoxDecoration(
      shape: BoxShape.circle,
      gradient: const LinearGradient(
        colors: [
          Color(0xff0fe3a7),
          Color(0xff00bada),
        ],
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          offset: const Offset(0, 4),
          spreadRadius: 0,
          color: Colors.green.withOpacity(0.5),
        )
      ]);

  static BoxDecoration pdfFloatingBackgroundColor = const BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Color(0x80610303), blurRadius: 12, offset: Offset(0, 6))
      ],
      shape: BoxShape.circle,
      gradient: LinearGradient(colors: [Color(0xfffc1c1c), Color(0xff8d0404)]));

  static String x = "assets/x.jpg";
  static String x2 = "assets/x2.png";

  //Full Screen Card
  static String left_arrow_full_screen_page =
      "assets/images/icons/homepage_icons/left_arrow_full_screen_page.svg";
  static String right_arrow_full_screen_page =
      "assets/images/icons/homepage_icons/right_arrow_full_screen_page.svg";

  //My Pdf Page
  static String myPdfIcon = "assets/images/icons/my_pdf_icon/my_pdf_icon.svg";
  static String pdfFloatIcon =
      "assets/images/icons/my_pdf_icon/pdf_float_icon.svg";
  static String pdfFilterIcon =
      "assets/images/icons/my_pdf_icon/filter_icon.svg";
  static String pdfSelectAllIcon =
      "assets/images/icons/my_pdf_icon/pdf_select_all_icon.svg";
  static String pdfSelectAllBlueIcon =
      "assets/images/icons/my_pdf_icon/photo_select_all_blue.svg";
  static String pdfPhotoPickCheckFalse =
      "assets/images/icons/my_pdf_icon/photo_pick_check_false.svg";
  static String pdfPhotoPickCheckTrue =
      "assets/images/icons/my_pdf_icon/photo_pick_check_true.svg";

  static String pdfShareIcon = "assets/images/icons/my_pdf_icon/share_icon.svg";

  static String pdfExample = "assets/images/icons/my_pdf_icon/pdf_example.png";

  static String pdfSave = "assets/images/icons/my_pdf_icon/pdf_share.svg";

  static String pdfSoruSakla =
      "assets/images/icons/my_pdf_icon/pdf_sorusakla.svg";

  //Tag Icons

  static String tagCardIcon =
      "assets/images/icons/tag_icons/tag_folder_icon.svg";
  static String allTagCardIcon =
      "assets/images/icons/tag_icons/all_tag_card_icon.svg";
  static String tagFloatingButton =
      "assets/images/icons/tag_icons/tagFloatingIcon.svg";

  static BoxDecoration tagFloatingDecoration = BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 245, 141, 44),
          Color.fromARGB(255, 252, 187, 141),
        ],
      ),
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, 6),
            spreadRadius: 0,
            color: const Color.fromARGB(255, 245, 141, 45).withOpacity(0.5))
      ]);

//Capture Paper

  static String brightness = "assets/images/icons/capture_paper/brightness.svg";
  static String contrast = "assets/images/icons/capture_paper/contrast.svg";

  static String botNavBarTag =
      "assets/images/icons/capture_paper/bot_nav_bar_tag.svg";
  static String botNavBarTagOnTap =
      "assets/images/icons/capture_paper/on_tap_bot_nav_bar_tag.svg";

  static String botNavBarFilter =
      "assets/images/icons/capture_paper/bot_nav_bar_filter.svg";
  static String botNavBarFilterOnTap =
      "assets/images/icons/capture_paper/on_tap_bot_nav_bar_filter.svg";

  static String check2 = "assets/images/icons/capture_paper/check2.svg";
}
