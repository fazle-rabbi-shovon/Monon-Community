import 'package:flutter/cupertino.dart';
import 'package:monon/ui/folder/folder_view.dart';
import 'package:monon/ui/settings/settings_view.dart';

import 'Nav.dart';

class NavPage extends StatelessWidget {
  const NavPage({
    Key? key,
    required this.nav,
    required this.currentIndex,

  }) : super(key: key);

  final Nav nav;
  final int currentIndex;


  @override
  Widget build(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return const FolderView();
      // case 1:
      //   return const InfoView();
      case 1:
        return  SettingsView();
      default:
        return const FolderView();
    }
  }
}
