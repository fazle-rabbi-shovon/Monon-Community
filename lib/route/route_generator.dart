import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monon/ui/feelings/feelings_main_view.dart';
import 'package:monon/ui/feelings/feelings_view.dart';
import 'package:monon/ui/folder/folder_view.dart';
import 'package:monon/ui/info/info_view.dart';
import 'package:monon/ui/submit/submit_view.dart';

import '../ui/home/home_view.dart';
import '../ui/login/login_view_final.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return navigateToRoute(
          builder: (_) => LoginViewFinal(),
        );

      case '/home':
        return navigateToRoute(
          builder: (_) => HomeView(),
        );

      case '/feelings_main':
        return navigateToRoute(
          builder: (_) => const FeelingsMainView(),
        );

      case '/emotions_first_submit':
        return navigateToRoute(
          builder: (_) => const FeelingsView(),
        );

      case '/folder':
        return navigateToRoute(
          builder: (_) => const FolderView(),
        );

      case '/info':
        return navigateToRoute(
          builder: (_) => const InfoView(),
        );

      case '/submit':
        return navigateToRoute(
          builder: (_) => const SubmitView(),
        );

      default:
        return _underConstructionRoute('Error');
    }
  }

  static navigateToRoute({required Widget Function(BuildContext) builder}) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: builder);
    } else {
      return MaterialPageRoute(builder: builder);
    }
  }

  static Route<dynamic> _underConstructionRoute(String title) {
    return navigateToRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Text(
              (title == 'Error') ? 'ERROR' : 'Under Construction',
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        );
      },
    );
  }
}
