

import 'package:stream_internet_status/network_aware_widget.dart';
import 'package:stream_internet_status/network_status_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamInternetStatus extends StatefulWidget {
  const StreamInternetStatus({super.key, required this.onlineChild, required this.offlineChild,});
  final Widget onlineChild;
  final Widget offlineChild;

  @override
  State<StreamInternetStatus> createState() => _WidgetState();
}

class _WidgetState extends State<StreamInternetStatus> with WidgetsBindingObserver {
  final _networkStatusService = NetworkStatusService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<NetworkStatus>(
            create: (context) => _networkStatusService.networkStatusController.stream,
            initialData: NetworkStatus.Online,
            child: NetworkAwareWidget(
              onlineChild: widget.onlineChild,
              offlineChild: widget.offlineChild,
            ),
          );
  }

}
