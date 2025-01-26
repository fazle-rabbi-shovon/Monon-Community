import 'package:flutter/material.dart';

import '../../../../localization/localization_constants.dart';
import '../../../../util/color_util.dart';
import '../../../../util/image_util.dart';
import 'nav_item.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: ColorUtil.bgWhite,
      selectedItemColor: ColorUtil.navSelected,
      unselectedItemColor: ColorUtil.navDeselected,
      items: [
        NavItem(
          "Feelings",
          ImageUtil.NAV_FEELINGS,
        ),
        NavItem(
          "folder",
          ImageUtil.NAV_FOLDER,
        ),
        NavItem(
          "Info",
          ImageUtil.NAV_INFO,
        ),
        NavItem(
          "Submit",
          ImageUtil.NAV_SUBMIT,
        ),
      ],
      onTap: onTap,
    );
  }
}
