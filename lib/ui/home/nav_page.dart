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
  }) : super(key: key);

  final Nav nav;

  @override
  Widget build(BuildContext context) {
    switch (nav) {
      case Nav.feelings:
        return const FeelingsView();
      case Nav.folder:
        return const FolderView();
      case Nav.info:
        return const InfoView();
      case Nav.submit:
        return const SubmitView();
      default:
        return const FeelingsView();
    }
  }
}
