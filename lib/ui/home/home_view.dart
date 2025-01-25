import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base/base_view_state.dart';
import '../../../../localization/localization_constants.dart';
import '../../../../util/color_util.dart';
import '../../route/navigation_service.dart';
import '../../util/number_for_features.dart';
import '../login/common_dialog.dart';
import '../nav.dart';
import 'bottom_nav.dart';
import 'bottom_progress_bar.dart';
import 'nav_page.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseViewState<HomeView>
    with SingleTickerProviderStateMixin {
  // late HomePresenter _presenter;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // final AnalyticsService _analyticsService = AnalyticsService();
  late String currentDeviceId;

  // Employee? _user;
  // late VersionData _versionData;

  bool _admin = false;
  bool _lineManager = false;
  bool _isAdminEntry = true;

  Nav _navState = Nav.dashboard;
  Nav _lastState = Nav.dashboard;
  int _currentIndex = 0;
  bool _filterDataLoaded = false;

  double _rating = 0;
  bool _showPrompt = false;
  int _currentMonthNumber = DateTime.now().month;
  int _currentYear = DateTime.now().year;

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

  // void setUser(Employee? user) {
  //   if (user != null) {
  //     this._user = user;
  //     _item = EmployeeListItem.fromEmployee(employee: user);
  //     _admin = (_user?.isAdmin ?? false) ||
  //         (_user?.isCompanyAdmin ?? false) ||
  //         (_user?.isHrManager ?? false);
  //     _lineManager = user.isLineManager ?? false;
  //
  //     if ((_admin || _lineManager) && !_filterDataLoaded)
  //       _presenter.fetchFilterData();
  //   }
  // }

  void _launch(BuildContext context) {
    // StoreRedirect.redirect(
    //     androidAppId: AppConfig.of(context)!.stringResource!.playStoreId,
    //     iOSAppId: AppConfig.of(context)!.stringResource!.appStoreId);
  }

  // void checkVersion(VersionData versionData, StringResource? stringResource,
  //     BuildContext context) {
  //   PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
  //     String version = packageInfo.version;
  //     int versionInt = int.parse(version.replaceAll('.', ''));
  //     int versionDataInt = int.parse(
  //       versionData.versionTotal!.version!.InHRM!.replaceAll('.', ''),
  //     );
  //     if (versionDataInt > versionInt) {
  //       showDialog(
  //         context: context,
  //         builder: (context) => CommonDialog(
  //             title: "New version available",
  //             titleWeight: true,
  //             description:
  //             "Please, update app to new version to continue responding.",
  //             button2: "NO, THANKS",
  //             button2Color: ColorUtil.button,
  //             button2Flag: true,
  //             button1: "UPDATE",
  //             button1Color: ColorUtil.button,
  //             button1Func: () => {_launch(context)}),
  //       );
  //     }
  //   });
  // }

  void afterBuild() {
    // SystemChrome.restoreSystemUIOverlays();
    NumberUtil.deviceHeight = MediaQuery.of(context).size.height;

    // if (_presenter != null) _presenter.fetchUserData();

    // if (_navState == Nav.more) _moreOptions();

    // if (_presenter != null) _presenter.checkVersion();
    // if (_presenter != null && _versionData.state == RequestState.init)
    //   _presenter.checkVersion();
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

    // return MultiProvider(
    //   providers: [
    //     // Connectivity
    //     ChangeNotifierProvider(create: (context) => ConnectionStatusData()),
    //     // Nav
    //     ChangeNotifierProvider(create: (context) => NavData()),
    //     // Home View
    //     ChangeNotifierProvider(create: (context) => UserData()),
    //     ChangeNotifierProvider(create: (context) => FilterData()),
    //     ChangeNotifierProvider(create: (context) => VersionData()),
    //     // ChangeNotifierProvider(create: (context) => HistoryDataModel()),
    //   ],
    //   child: Consumer2<UserData, VersionData>(
    //     builder: (ctx, userData, versionData, child) {
    //       _presenter = HomePresenter(ctx);
    //       config = AppConfig.of(context);
    //
    //       // _versionData = versionData;
    //       _versionData = ctx.watch<VersionData>();
    //
    //       if (versionData.state == RequestState.completed) {
    //         SharedPrefUtil().getLastChecked().then((value) async {
    //           int yesterday = DateTime.now()
    //               .subtract(Duration(hours: 24))
    //               .millisecondsSinceEpoch;
    //           int currentTime = DateTime.now().millisecondsSinceEpoch;
    //           if (value == null || value < yesterday) {
    //             if (_versionData != null) {
    //               SharedPrefUtil().setLastChecked(currentTime);
    //               checkVersion(_versionData, config?.stringResource, ctx);
    //             }
    //           }
    //         });
    //       }
    //
    //       setUser(userData.employee);
    //
    //       return (_user == null)
    //           ? Scaffold(
    //         body: WillPopScope(
    //           onWillPop: onWillPop,
    //           child: BottomProgressBar(),
    //         ),
    //       )
    //           : (_filterDataLoaded)
    //           ? _homeBody()
    //           : Consumer<FilterData>(
    //         builder: (context, filterData, child) {
    //           this._filterData = filterData;
    //           _filterDataLoaded = filterData != null;
    //           return _homeBody();
    //         },
    //       );
    //     },
    //   ),
    // );
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
              title: Text(getTranslated(context, "EXIT_APP_TITLE")),
              content: Text(getTranslated(context, "EXIT_APP_MSG")),
              actions: <Widget>[
                TextButton(
                  onPressed: () =>
                      NavigationService.getCurrentState()?.pop(false),
                  child: Text(getTranslated(context, "NO_TITLE")),
                ),
                TextButton(
                  onPressed: () =>
                      NavigationService.getCurrentState()?.pop(true),
                  child: Text(getTranslated(context, "YES_TITLE")),
                ),
              ],
            ),
          ) ??
          false;
    } else {}

    return willPop;
  }

  // Widget _homeBody() {
  //   return Consumer<NavData>(
  //     builder: (ctx, navData, child) {
  //       _navState = navData.navState;
  //
  //       return Scaffold(
  //         key: _scaffoldKey,
  //         body: WillPopScope(
  //           onWillPop: onWillPop,
  //           child: _appBody(),
  //         ),
  //         bottomNavigationBar:
  //         (ctx.watch<ConnectionStatusData>().connectivityResult ==
  //             ConnectivityResult.none)
  //             ? SizedBox(
  //           // Need to observe
  //           height: Platform.isIOS ? 131 : 98,
  //
  //           child: Column(
  //             children: [
  //               NoInternetText(),
  //               _bottomNavBar(),
  //             ],
  //           ),
  //         )
  //             : _bottomNavBar(),
  //       );
  //     },
  //   );
  // }

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
    );
  }

  void _onTapAdminBottomNav(int index) {
    if (index != _currentIndex) {
      if (index != 3) _currentIndex = index;
       _lastState = _navState;

      switch (index) {
        case 0:
          setState(() {
            _currentIndex = 0;
            _navState = Nav.feelings;
          });
          break;
        case 1:
          setState(() {
            _currentIndex = 1;
            _navState = Nav.folder;
          });
          break;
        case 2:
          setState(() {
            _currentIndex = 2;
            _navState = Nav.info;
          });
          break;
        case 3:
          setState(() {
            _currentIndex = 3;
            _navState = Nav.submit;
          });
          break;
        default:
          _currentIndex = 0;
          _navState = Nav.feelings;
          break;
      }
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
