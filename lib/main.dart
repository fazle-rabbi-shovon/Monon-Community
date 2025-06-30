import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:monon/route/navigation_service.dart';
import 'package:monon/route/route_generator.dart';
import 'package:monon/services/version_control.dart';
import 'package:monon/util/color_util.dart';

import 'model/activity_progress.dart';

Future<void> main() async {
  // setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  // Register the adapter
  Hive.registerAdapter(ActivityProgressAdapter());

  // Open the box
  await Hive.openBox<ActivityProgress>('activity_progress');

  // Run version control to add activity types
  await VersionControl.checkAndUpdateHive(currentVersion: 1);
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  static _MyAppState? state;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //UI Overlay
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: ColorUtil.statusBar,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark
        //systemNavigationBarColor: ColorUtil.navigationBar,
      ),
    );

    return MaterialApp(
      title: "Monon",
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white, // Sets background of entire app
        // primarySwatch: ColorUtil.primary, // For AppBar, buttons, etc.
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ColorUtil.bgGreyDarkReal, // Background color of bottom nav
          selectedItemColor: ColorUtil.button, // Selected item color
          unselectedItemColor: ColorUtil.bgGrey, // Unselected item color
        ),
      ),
      navigatorKey: NavigationService.getNavigatorKey(),
      supportedLocales: [Locale('en', 'US'), Locale('bn', null)],
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,

    );
  }
}

