import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../base/base_view_state.dart';
import '../../../../localization/localization_constants.dart';
import '../../../../util/color_util.dart';
import '../../route/navigation_service.dart';
import '../../util/number_for_features.dart';
import '../login/common_dialog.dart';
import '../nav.dart';
import 'bottom_nav.dart';
import 'nav_page.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseViewState<HomeView>
    with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late String currentDeviceId;

  Nav _navState = Nav.dashboard;
  int _currentIndex = 0;

  var config;

  @override
  void initState() {
    // _checkRatingPrompt();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void afterBuild() {
    // SystemChrome.restoreSystemUIOverlays();
    NumberUtil.deviceHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.restoreSystemUIOverlays();
    WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild());

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorUtil.statusBar,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light),
    );

    return _homeBody();
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

    willPop = _navState == Nav.dashboard;
    if (willPop) {
      willPop = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
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

  Widget _homeBody() {
    _navState = Nav.dashboard;
    return Scaffold(
      key: _scaffoldKey,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: _appBody(),
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
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
        _navState = Nav.feelings;

        setState(() {});
        break;
      case 1:
        _currentIndex = 1;
        _navState = Nav.folder;
        setState(() {});
        break;
      case 2:
        _currentIndex = 2;
        _navState = Nav.info;
        setState(() {});
        break;
      case 3:
        _currentIndex = 3;
        _navState = Nav.submit;
        setState(() {});
        break;
      default:
        _currentIndex = 0;
        _navState = Nav.feelings;
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
}
