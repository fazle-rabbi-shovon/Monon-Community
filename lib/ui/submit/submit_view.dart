
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';

class SubmitView extends StatefulWidget {

  const SubmitView({super.key});
  @override
  State<SubmitView> createState() => _SubmitViewState();
}

class _SubmitViewState extends State<SubmitView>
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
          child: Text("Submit",
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
        "Submit",
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

