import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monon/Common/normal_gradient_button_decoration.dart';
import 'package:monon/Common/yellow_gradient_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../route/navigation_service.dart';
import '../../shared_pref/shared_pref_util.dart';
import '../../util/color_util.dart';
import '../../util/dimen_values_util.dart';

// ignore: must_be_immutable
class SettingsView extends StatefulWidget {
   SettingsView( {super.key});



  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with SingleTickerProviderStateMixin {

  String userRole = "volunteer";

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

  Future<void> afterBuild() async {
     userRole = (await SharedPrefUtil().getUserRole())!;
     setState(() {

     });
  }

  // Replace with the actual help phone number
  final String helpPhoneNumber = '+8801737281391';

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: ()  {
                // NavigationService.getCurrentState()?.pushNamed('/settings_submit');
                NavigationService.getCurrentState()?.pushNamed('/Password_changer');
              },
              child: Container(
                height: 50.0,
                decoration: GradientButtonDecoration(),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // getTranslated(context, "LOGIN_TITLE"),
                        "পাসওয়ার্ড পরিবর্তন",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: ()  {
                NavigationService.getCurrentState()?.pushNamed('/personal_info_update');
              },
              child: Container(
                height: 50.0,
                decoration: GradientButtonDecoration(),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // getTranslated(context, "LOGIN_TITLE"),
                        "প্রোফাইল আপডেট",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Visibility(
              visible: !(userRole == "participant"),
              child: GestureDetector(
                onTap: ()  {
                  if(userRole == "admin"){
                    NavigationService.getCurrentState()?.pushNamed('/volunteer_creation');
                  }else{
                    NavigationService.getCurrentState()?.pushNamed('/participant_creation');
                  }

                },
                child: Container(
                  height: 50.0,
                  decoration: GradientButtonDecoration(),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          // getTranslated(context, "LOGIN_TITLE"),
                          "একাউন্ট তৈরি",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
      height: DimenValuesUtil.buttonHeight,
      decoration: NormalGradientButtonDecoration(),
      child: InkWell(
        onTap: () {
        },
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: DimenValuesUtil.title,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.lock),
            ],
          ),
        ),
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
        "সেটিংস",
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
