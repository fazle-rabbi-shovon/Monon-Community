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
      elevation: 5.0,

      backgroundColor: Colors.grey.shade100,
      selectedItemColor: ColorUtil.navSelected,
      unselectedItemColor: ColorUtil.navDeselected,
      items: [
        // NavItem(
        //   "Feelings",
        //   ImageUtil.NAV_FEELINGS,
        // ),
        NavItem(
          "আবেগ",
          ImageUtil.NAV_FEELINGS,
        ),
        // NavItem(
        //   "Info",
        //   ImageUtil.NAV_INFO,
        // ),
        NavItem(
          "সেটিংস",
          ImageUtil.NAV_SUBMIT,
        ),
      ],
      onTap: onTap,
    );
  }
}
