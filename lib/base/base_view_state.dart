import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

abstract class BaseViewState<T extends StatefulWidget> extends State<T> {
  // StreamSubscription? _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    // Connectivity()
    //     .checkConnectivity()
    //     .then((result) => connectionStatus(result));
    //
    // _connectivitySubscription =
    //     Connectivity().onConnectivityChanged.listen(connectionStatus);
  }

  @override
  void dispose() {
    super.dispose();

    // _connectivitySubscription?.cancel();
  }

  // Future<void> connectionStatus(ConnectivityResult result);
}
