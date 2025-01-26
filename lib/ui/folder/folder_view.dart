import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';

class FolderView extends StatefulWidget {

  const FolderView({super.key});
  @override
  State<FolderView> createState() => _FolderViewState();
}

class _FolderViewState extends State<FolderView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: _appbar(),
        body: const Center(
          child: Text("Folder",
          style: TextStyle(
            fontSize: 30.0
          ),),
        ),
      ),
    );
  }

  _appbar(){
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.transparent,
          ),
          onPressed: () {},
        ),
      ],
      leading: Container(
        child: const Center(

        ),
      ),
      title: Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "Folder",
        style: TextStyle(
          color: ColorUtil.primary,
          fontSize: 18.0,
        ),
      ),
      backgroundColor: ColorUtil.bgGrey,
      iconTheme: IconThemeData(color: ColorUtil.primary),
      elevation: 0,
      centerTitle: true,
    );
  }
}

