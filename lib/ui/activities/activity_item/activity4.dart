import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';


class Activity4 extends StatefulWidget {

  const Activity4({super.key});
  @override
  State<Activity4> createState() => _Activity4State();
}

class _Activity4State extends State<Activity4> {
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
    return Scaffold(
      appBar: _appbar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
      ),
    );
  }

  _appbar() {
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
        child: const Center(),
      ),
      title: const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "Activities 4",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      backgroundColor: ColorUtil.primary,
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      centerTitle: true,
    );
  }
}

