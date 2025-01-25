import 'package:flutter/material.dart';

class NavItem extends BottomNavigationBarItem {
  NavItem(
    String title,
    String iconPath,
  ) : super(
          icon: ImageIcon(
            AssetImage(iconPath),
          ),
          label: title,
        );
}
