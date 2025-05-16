import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> getNavigatorKey() {
    return _navigatorKey;
  }

  static BuildContext? getCurrentContext() => _navigatorKey.currentContext;

  static NavigatorState? getCurrentState() {
    return _navigatorKey.currentState;
  }
}
