import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monon/ui/feelings/feelings_main_view.dart';
import 'package:monon/ui/feelings/feelings_view.dart';
import 'package:monon/ui/folder/folder_view.dart';
import 'package:monon/ui/info/info_view.dart';
import 'package:monon/ui/password_changer/password_changer.dart';
import 'package:monon/ui/submit/language_setting.dart';
import 'package:monon/ui/submit/submit_view.dart';

import '../ui/activities/activities_main.dart';
import '../ui/folder/video.dart';
import '../ui/home/home_view.dart';
import '../ui/login/login_view_state.dart';
import '../ui/submit/settings_submit.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return navigateToRoute(
          builder: (_) => LoginViewFinal(),
        );

      // case '/home':
      //   return navigateToRoute(
      //     builder: (_) => HomeView(),
      //   );

      case '/home':
        if (args is int) {
          int index = args;

          return navigateToRoute(
            builder: (_) => HomeView(index),
          );
        }

        return _underConstructionRoute('Error');

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

      case '/Password_changer':
        return navigateToRoute(
          builder: (_) => const PasswordChanger(),
        );

      case '/submit':
        return navigateToRoute(
          builder: (_) => const SubmitView(),
        );

      case '/video':
        return navigateToRoute(
          builder: (_) => const VideoPlayerScreen(),
        );

      case '/activities_main':
        return navigateToRoute(
          builder: (_) => const ActivitiesMain(),
        );

      case '/settings_submit':
        return navigateToRoute(
          builder: (_) => const SettingsSubmitView(),
        );

      case '/language_setting':
        return navigateToRoute(
          builder: (_) => const LanguageSettingsView(),
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
