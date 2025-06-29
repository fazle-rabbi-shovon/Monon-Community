import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monon/ui/info/info_view.dart';
import 'package:monon/ui/settings/password_changer.dart';
import 'package:monon/ui/settings/settings_view.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../base/base_view_state.dart';
import '../../../../localization/localization_constants.dart';
import '../../../../util/color_util.dart';
import '../../route/navigation_service.dart';
import '../../shared_pref/shared_pref_util.dart';
import '../../util/number_for_features.dart';
import '../feelings/feelings_main_view.dart';
import '../folder/folder_view.dart';
import '../login/common_dialog.dart';
import 'Nav.dart';
import 'bottom_nav.dart';
import 'nav_data.dart';
import 'nav_page.dart';


class HomeView extends StatefulWidget {

  HomeView(this.index);

  int index;

  @override
  State<HomeView> createState() => _HomeViewState(index);

}

class _HomeViewState extends BaseViewState<HomeView>
    with SingleTickerProviderStateMixin {


  _HomeViewState(this._currentIndex);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late String currentDeviceId;

  Nav _navState = Nav.feelings;
  int _currentIndex;


  var config;

  @override
  void initState() {
    // _checkRatingPrompt();
    _checkAppVersion();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> afterBuild() async {
    // SystemChrome.restoreSystemUIOverlays();
    NumberUtil.deviceHeight = MediaQuery
        .of(context)
        .size
        .height;

  }

  // int _currentIndex = 0;

  // List of pages corresponding to bottom navigation bar tabs
  final List<Widget> _pages = [
    // const FeelingsMainView(),
    const FolderView(),
    const InfoView(),
     SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild());

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: ColorUtil.statusBar,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light),
    );
    return _homeBody();
  }

  Widget _homeBody() {
    return ChangeNotifierProvider(
      create: (context) => NavData(),
      child: Consumer<NavData>(
        builder: (ctx, navData, child) {
          _navState = navData.navState;

          return Scaffold(
            key: _scaffoldKey,
            body: WillPopScope(
              onWillPop: onWillPop,
              child: _appBody(),
            ),
            bottomNavigationBar:
            _bottomNavBar(),
          );
        },
      ),
    );
  }

  Future _logoutDialogue(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
            title: getTranslated(context, "ARE_YOU_SURE"),
            titleColor: ColorUtil.primary,
            titleWeight: null,
            description: getTranslated(context, "CONFIRMATION_LOGOUT"),
            button2: getTranslated(context, "NO_TITLE"),
            button2Flag: false,
            button2Color: ColorUtil.red,
            button1: getTranslated(context, "YES_TITLE"),
            button1Flag: true,
            button1Color: ColorUtil.button);
      },
    ) ??
        false;
  }

  Future<bool> onWillPop() async {
    bool willPop = false;

    willPop = _navState == Nav.feelings;
    if (willPop) {
      willPop = await showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              // title: Text(getTranslated(context, "EXIT_APP_TITLE")),
              title: const Text("Exit"),
              // content: Text(getTranslated(context, "EXIT_APP_MSG")),
              content: const Text("Do you want to exit?"),
              actions: <Widget>[
                TextButton(
                  onPressed: () =>
                      NavigationService.getCurrentState()?.pop(false),
                  // child: Text(getTranslated(context, "NO_TITLE")),
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () =>
                      NavigationService.getCurrentState()?.pop(true),
                  // child: Text(getTranslated(context, "YES_TITLE")),
                  child: const Text("Yes"),
                ),
              ],
            ),
      ) ??
          false;
    } else {}

    return willPop;
  }

  Widget _bottomNavBar() {
    return BottomNav(
      currentIndex: _currentIndex,
      onTap: _onTapAdminBottomNav,
    );
  }

  Widget _appBody() {
    return NavPage(
      nav: _navState,
      currentIndex: _currentIndex,
    );
  }

  void _onTapAdminBottomNav(int index) {
    _currentIndex = index;

    switch (index) {
      case 0:
        _currentIndex = 0;
        _navState = Nav.folder;

        setState(() {});
        break;
      case 1:
        _currentIndex = 1;
        _navState = Nav.submit;
        setState(() {});
        break;
    // case 2:
    //   _currentIndex = 2;
    //   _navState = Nav.info;
    //   setState(() {});
    //   break;
      default:
        _currentIndex = 0;
        _navState = Nav.folder;
        break;
    }
  }

  Future<void> _logout() async {
    NavigationService.getCurrentState()?.pushReplacementNamed('/');
  }

  void _onLogoutTap() {
    NavigationService.getCurrentState()?.pop();
    _logoutDialogue(context).then((value) {
      if (value) _logout();
    });
  }

  Future<void> _checkAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;

      final doc = await FirebaseFirestore.instance.collection('config').doc(
          'app_version').get();
      if (doc.exists) {
        final latestVersion = doc['latest_version'];
        final isUpdateRequired = doc['update_required'] ?? false;
        final playStoreUrl = doc['play_store_url'];

        if (_isVersionLower(currentVersion, latestVersion) &&
            isUpdateRequired) {
          _showUpdateDialog(playStoreUrl);
        }
      }
    } catch (e) {
      debugPrint("Version check failed: $e");
    }
  }

  bool _isVersionLower(String current, String latest) {
    final currentParts = current.split('.').map(int.parse).toList();
    final latestParts = latest.split('.').map(int.parse).toList();

    for (int i = 0; i < latestParts.length; i++) {
      if (i >= currentParts.length || currentParts[i] < latestParts[i])
        return true;
      if (currentParts[i] > latestParts[i]) return false;
    }
    return false;
  }

  void _showUpdateDialog(String playStoreUrl) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) =>
          AlertDialog(
            title: const Text("Update Available",
              style: TextStyle(color: ColorUtil.mainColor),),
            content: const Text(
                "A new version of the app is available. Please update to continue."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  NavigationService.getCurrentState()
                      ?.pop();
                },
                child: const Text(
                  "Later", style: TextStyle(color: Colors.red),),
              ),
              TextButton(
                onPressed: () async {
                  final uri = Uri.parse(playStoreUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                child: const Text(
                  "Update", style: TextStyle(color: ColorUtil.mainColor),),
              ),
            ],
          ),
    ) ??
        NavigationService.getCurrentState()
            ?.pop()
    ;
  }
}
