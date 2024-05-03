// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStatus { Online, Offline }

NetworkStatus networkStatus = NetworkStatus.Online;

class NetworkStatusService {
  StreamController<NetworkStatus> networkStatusController = StreamController<NetworkStatus>();

  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen((status) {
      networkStatusController.add(_getNetworkStatus(status));
    });
  }

  NetworkStatus _getNetworkStatus(ConnectivityResult status) {
    networkStatus = status == ConnectivityResult.mobile || status == ConnectivityResult.wifi
        ? NetworkStatus.Online
        : NetworkStatus.Offline;
    return networkStatus;
  }
}
