import 'package:check_internet_active/network_status_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkAwareWidget extends StatelessWidget {
  final Widget onlineChild;
  final Widget offlineChild;

  const NetworkAwareWidget({Key? key, required this.onlineChild, required this.offlineChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NetworkStatus networkStatus = Provider.of<NetworkStatus>(context);
    return Stack(children: [
      onlineChild,
      if (networkStatus == NetworkStatus.Offline)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: offlineChild),
    ],);
  }
}
