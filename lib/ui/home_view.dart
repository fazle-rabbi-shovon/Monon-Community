import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../base/base_view_state.dart';
import '../../../localization/localization_constants.dart';
import '../../../util/color_util.dart';
import 'nav.dart';

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
    _checkRatingPrompt();

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

    if (_presenter != null) _presenter.fetchUserData();

    if (_navState == Nav.more) _moreOptions();

    // if (_presenter != null) _presenter.checkVersion();
    if (_presenter != null && _versionData.state == RequestState.init)
      _presenter.checkVersion();
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

    return MultiProvider(
      providers: [
        // Connectivity
        ChangeNotifierProvider(create: (context) => ConnectionStatusData()),
        // Nav
        ChangeNotifierProvider(create: (context) => NavData()),
        // Home View
        ChangeNotifierProvider(create: (context) => UserData()),
        ChangeNotifierProvider(create: (context) => FilterData()),
        ChangeNotifierProvider(create: (context) => VersionData()),
        // ChangeNotifierProvider(create: (context) => HistoryDataModel()),
      ],
      child: Consumer2<UserData, VersionData>(
        builder: (ctx, userData, versionData, child) {
          _presenter = HomePresenter(ctx);
          config = AppConfig.of(context);

          // _versionData = versionData;
          _versionData = ctx.watch<VersionData>();

          if (versionData.state == RequestState.completed) {
            SharedPrefUtil().getLastChecked().then((value) async {
              int yesterday = DateTime.now()
                  .subtract(Duration(hours: 24))
                  .millisecondsSinceEpoch;
              int currentTime = DateTime.now().millisecondsSinceEpoch;
              if (value == null || value < yesterday) {
                if (_versionData != null) {
                  SharedPrefUtil().setLastChecked(currentTime);
                  checkVersion(_versionData, config?.stringResource, ctx);
                }
              }
            });
          }

          setUser(userData.employee);

          return (_user == null)
              ? Scaffold(
            body: WillPopScope(
              onWillPop: onWillPop,
              child: BottomProgressBar(),
            ),
          )
              : (_filterDataLoaded)
              ? _homeBody()
              : Consumer<FilterData>(
            builder: (context, filterData, child) {
              this._filterData = filterData;
              _filterDataLoaded = filterData != null;
              return _homeBody();
            },
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

    willPop = _navState == Nav.dashboard;
    if (willPop) {
      willPop = await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text(getTranslated(context, "EXIT_APP_TITLE")),
          content: new Text(getTranslated(context, "EXIT_APP_MSG")),
          actions: <Widget>[
            new TextButton(
              onPressed: () =>
                  NavigationService.getCurrentState()?.pop(false),
              child: new Text(getTranslated(context, "NO_TITLE")),
            ),
            new TextButton(
              onPressed: () =>
                  NavigationService.getCurrentState()?.pop(true),
              child: new Text(getTranslated(context, "YES_TITLE")),
            ),
          ],
        ),
      ) ??
          false;
    } else {
      _currentIndex = 0;
      _presenter.setNavState(Nav.dashboard);
    }

    return willPop;
  }

  Widget _homeBody() {
    return Consumer<NavData>(
      builder: (ctx, navData, child) {
        _navState = navData.navState;

        return Scaffold(
          key: _scaffoldKey,
          body: WillPopScope(
            onWillPop: onWillPop,
            child: _appBody(),
          ),
          bottomNavigationBar:
          (ctx.watch<ConnectionStatusData>().connectivityResult ==
              ConnectivityResult.none)
              ? SizedBox(
            // Need to observe
            height: Platform.isIOS ? 131 : 98,

            child: Column(
              children: [
                NoInternetText(),
                _bottomNavBar(),
              ],
            ),
          )
              : _bottomNavBar(),
        );
      },
    );
  }

  Widget _bottomNavBar() {
    return (_admin || _lineManager)
        ? BottomNavAdmin(
      currentIndex: _currentIndex,
      onTap: _onTapAdminBottomNav,
    )
        : BottomNavUser(
      currentIndex: _currentIndex,
      onTap: _onTapUserBottomNav,
    );
  }

  Widget _appBody() {
    return (_admin || _lineManager)
        ? NavAdminPage(
      nav: (_navState == Nav.more) ? _lastState : _navState,
      user: _user!,
      filterData: _filterData!,
      loadAttendance: _loadAttendance,
      loadProfile: _loadProfile,
    )
        : NavUserPage(
      nav: (_navState == Nav.more) ? _lastState : _navState,
      user: _user!,
      filterData: _filterData!,
      item: _item,
    );
  }

  void _onTapAdminBottomNav(int index) {
    if (index != _currentIndex) {
      if (index != 4) _currentIndex = index;
      switch (index) {
        case 1:
          _presenter.setNavState(Nav.report);
          break;
        case 2:
          _presenter.setNavState(Nav.profile);
          break;
        case 3:
          _presenter.setNavState(Nav.pending);
          break;
        case 4:
          _moreOptions();
          break;
        default:
          _presenter.setNavState(Nav.dashboard);
          break;
      }

      if (_navState != Nav.more) _lastState = _navState;
    }
  }

  void _onTapUserBottomNav(int index) {
    if (index != _currentIndex) {
      if (index != 4) _currentIndex = index;
      switch (index) {
        case 1:
          _presenter.setNavState(Nav.report);
          break;
        case 2:
          _presenter.setNavState(Nav.history);
          break;
        case 3:
          _presenter.setNavState(Nav.pending);
          break;
        case 4:
          _moreOptions();
          break;
        default:
          _presenter.setNavState(Nav.dashboard);
          break;
      }

      if (_navState != Nav.more) _lastState = _navState;
    }
  }

  void _loadAttendance(int id) {
    // if (AppConstants.isConnectedToInternet) {
    print('ATTENDANCE REPORT:ID: ' + id.toString());
    NavigationService.getCurrentState()
        ?.pushNamed('/attendance', arguments: id);
    // }
  }

  void _loadProfile(int employeeId) {
    print('Profile');
    NavigationService.getCurrentState()?.pushNamed(
      '/profile',
      arguments: PathArgumentProfile(
        employeeId,
        (_user!.isLineManager! && !_user!.isAdmin! && !_user!.isHrManager!)
            ? false
            : _isAdminEntry,
        _user?.isHrManager ?? false,
        _user?.isLineManager ?? false,
      ),
    );
  }

  void _employeeCreate() {
    if (_user?.isSiteManagementAdmin == true && _user?.isAdmin == false) {
      showDialog(
        context: context,
        builder: (context) => CommonDialog(
            description: "Access Denied",
            button2Color: ColorUtil.button,
            button2Flag: true,
            button1: "Ok",
            button1Color: ColorUtil.button,
            button1Func: () =>
            {NavigationService.getCurrentState()?.pop(true)}),
      );
    } else {
      print('Employee Create');
      NavigationService.getCurrentState()?.pushNamed(
        '/employeeCreate',
        arguments: _user?.shiftGroupId,
      );
    }
  }

  void _deviceAdd() {
    print('Device add');
    NavigationService.getCurrentState()
        ?.pushNamed('/device_add', arguments: _user?.officeId);
  }

  void _siteReport() {
    print('Site Report Admin');
    NavigationService.getCurrentState()?.push(
      MaterialPageRoute(
        builder: (context) => SiteReportView(_user!.id, true),
        fullscreenDialog: true,
      ),
    );
  }

  void _takeFingerprintListPage() {
    if (_user?.isSiteManagementAdmin == true && _user?.isAdmin == false) {
      showDialog(
        context: context,
        builder: (context) => CommonDialog(
            description: "Access Denied",
            button2Color: ColorUtil.button,
            button2Flag: true,
            button1: "Ok",
            button1Color: ColorUtil.button,
            button1Func: () =>
            {NavigationService.getCurrentState()?.pop(true)}),
      );
    } else {
      EmployeeListView employeeListView = EmployeeListView.employeeListItem(
        getTranslated(context, "TAKE_FINGERPRINT_TITLE"),
        _user!,
        _filterData!,
        Nav.take_fingerprint,
        _takeFingerprintPage,
      );
      NavigationService.getCurrentState()?.pushNamed(
        '/takeFingerprintList',
        arguments: employeeListView,
      );
    }
  }

  void _historyMorePage(EmployeeListItem item) {
    print('History');
    NavigationService.getCurrentState()?.pushNamed(
      '/history',
      arguments: PathArgumentHistory(item, item.employeeId!, true, true, 0),
    );
  }

  void _historyListPage() {
    print('History List');
    EmployeeListView employeeListView =
    EmployeeListView.employeeListItemHistory(
      'History',
      _user!,
      _filterData!,
      Nav.history,
      _historyMorePage,
    );
    NavigationService.getCurrentState()?.pushNamed(
      '/takeFingerprintList',
      arguments: employeeListView,
    );
  }

  void _manualEntryListPage() {
    print('Manual Entry List');
    EmployeeListView employeeListView =
    EmployeeListView.employeeListItemManualEntry(
      getTranslated(context, "HOTKEYS_MANUAL_ENTRY_TITLE"),
      _user!,
      _filterData!,
      Nav.manual_entry,
      _manualEntryMorePage,
    );
    NavigationService.getCurrentState()?.pushNamed(
      '/takeFingerprintList',
      arguments: employeeListView,
    );
  }

  void _manualEntryMorePage(EmployeeListItem item) {
    print('Manual Entry');
    NavigationService.getCurrentState()?.pushNamed('/manualEntry',
        arguments: PathArgumentManualEntry(item, _isAdminEntry, true, false));
  }

  void _takeFingerprintPage(EmployeeListItem item, int deviceId) {
    print('Take Fingerprint');
    NavigationService.getCurrentState()?.pushNamed('/takeFingerprint',
        arguments: PathArgument(item, deviceId, false));
  }

  void _allocatePage() {
    if (_user?.isSiteManagementAdmin == true && _user?.isAdmin == false) {
      showDialog(
        context: context,
        builder: (context) => CommonDialog(
            description: "Access Denied",
            button2Color: ColorUtil.button,
            button2Flag: true,
            button1: "Ok",
            button1Color: ColorUtil.button,
            button1Func: () =>
            {NavigationService.getCurrentState()?.pop(true)}),
      );
    } else {
      print('Allocate');
      NavigationService.getCurrentState()?.pushNamed('/allocation');
    }
  }

  Future<void> _logout() async {
    await useDeviceId();
    await logoutUserwithdeviceid(currentDeviceId);

    await SharedPrefUtil().clearAPITokens();

    DatabaseProvider.getInstance().then((database) {
      database.remoteCacheDao.deleteAll();

      if (!_admin) {
        database.attendanceDao.deleteAll();
      }
    });

    //LoginViewState.resetStaticVariables();

    NavigationService.getCurrentState()?.pushReplacementNamed('/');
    _clearBackgroundTask();
  }

  void _moreOptions() {
    Future moreOptions = showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) =>
      (_admin) ? _bottomSheetAdminLayout() : _bottomSheetUserLayout(),
    );

    moreOptions.then((_) {
      // On More Bottom Sheet dismiss
    });
  }

  Widget _bottomSheetAdminLayout() {
    return BottomSheetAdminLayout(
      user: _user,
      children: [
        EmployeeShortInfo(
          isAdminEntry: true,
          user: _user!,
          onEmployeeTap: _onEmployeeShortInfoTap,
          onLogoutTap: _onLogoutTap,
        ),
        CommonBottomSheetItems(true, _user!, _filterData!),
        HotkeyAdmin(
          _user!,
          _employeeCreate,
          _manualEntryListPage,
          _deviceAdd,
          _siteReport,
          _historyListPage,
          _takeFingerprintListPage,
          _allocatePage,
        ),
      ],
    );
  }

  Widget _bottomSheetUserLayout() {
    return Container(
      height: (_user?.office?.moduleCodeSet?.contains(
        NumberUtil.mobilePunchEnabledCompany,
      ) ??
          false)
          ? 250
          : 210,
      child: BottomSheetUserLayout(
        children: [
          EmployeeShortInfo(
            isAdminEntry: (_lineManager) ? true : false,
            user: _user!,
            onEmployeeTap: _onEmployeeShortInfoTap,
            onLogoutTap: _onLogoutTap,
          ),
          CommonBottomSheetItems(false, _user!, _filterData!),
        ],
      ),
    );
  }

  void _onEmployeeShortInfoTap(bool isAdminEntry, Employee user) {
    _isAdminEntry = isAdminEntry;
    _loadProfile(user.id);
  }

  void _onLogoutTap() {
    if (_showPrompt) {
      NavigationService.getCurrentState()?.pop();
      _appRatingDialogue(context);
    } else {
      NavigationService.getCurrentState()?.pop();
      _logoutDialogue(context).then((value) {
        if (value) _logout();
      });
    }
  }

  @override
  Future<void> connectionStatus(ConnectivityResult result) async {
    print(result);

    _presenter.setConnectionResult(result);
  }

  Future<void> _checkRatingPrompt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime lastPrompt =
    DateTime.fromMillisecondsSinceEpoch(prefs.getInt('lastPrompt') ?? 0);
    DateTime now = DateTime.now();
    int daysSincePrompt = now.difference(lastPrompt).inDays;
    if (daysSincePrompt >= 30) {
      setState(() {
        _showPrompt = true;
      });
    }
  }

  Future<void> _setLastPrompt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('lastPrompt', DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> _setLastPromptForNo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('lastPrompt',
        DateTime.now().subtract(Duration(days: 15)).millisecondsSinceEpoch);
  }

  Future<void> _submitRating(BuildContext context) async {
    await _setLastPrompt();
    setState(() {
      _showPrompt = false;
    });

    _launch(context);
    _logout();
  }

  Future<void> _submitNoRating(BuildContext context) async {
    await _setLastPromptForNo();
    setState(() {
      _showPrompt = false;
    });
    _logout();
  }

  Future _appRatingDialogue(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text('Rate the app')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('How would you rate this app?'),
                RatingBar.builder(
                  initialRating: _rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding:
                  EdgeInsets.symmetric(horizontal: 0.0, vertical: 3.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _submitNoRating(context);
                },
                child: Text('Not now'),
              ),
              ElevatedButton(
                onPressed: () {
                  _submitRating(context);
                },
                child: Text('Submit'),
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: ColorUtil.button, // Background color
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(ColorUtil.button),
                ),
              ),
            ],
          );
        }) ??
        false;
  }

  void _clearBackgroundTask() async{
    await BackgroundLocationTrackerManager.stopTracking();
    //await Workmanager().cancelAll();
  }

  Future<void>logoutUserwithdeviceid(String deviceId) async {
    final result = await PostLogout.logout(deviceId: deviceId);
    result.fold(
          (response) async {
        if (response.statusCode == 200) {
          //await SharedPrefUtil().clearAPITokens();
          print("Logout successful");
        } else {
          print("Logout failed: ${response.body}");
        }
      },
          (error) {
        // Handle the error string
        print("Error occurred: $error");
      },
    );
  }
  Future<void> useDeviceId() async {
    await _analyticsService.getModel();
    currentDeviceId = _analyticsService.deviceId;
  }

}
