import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:monon/ui/feelings/feelings_view.dart';
import 'package:monon/ui/folder/folder_view.dart';
import 'package:monon/ui/info/info_view.dart';
import 'package:monon/ui/submit/submit_view.dart';

import '../nav.dart';

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
    // switch (nav) {
    //   case Nav.feelings:
    //     return const FeelingsView();
    //   case Nav.folder:
    //     return const FolderView();
    //   case Nav.info:
    //     return const InfoView();
    //   case Nav.submit:
    //     return const SubmitView();
    //   default:
    //     return const FeelingsView();
    // }

    switch (currentIndex) {
      case 0:
        return const FeelingsView();
      case 1:
        return const FolderView();
      case 2:
        return const InfoView();
      case 3:
        return const SubmitView();
      default:
        return const FeelingsView();
    }
  }
}
