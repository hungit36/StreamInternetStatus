import 'package:stream_internet_status_example/my_loading_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoInterNetWidget extends StatefulWidget {
  const NoInterNetWidget({
    super.key,
  });

  @override
  State<NoInterNetWidget> createState() => _WidgetState();
}

class _WidgetState extends State<NoInterNetWidget> {
  bool _isChecking = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyLoadingView(
        isLoading: _isChecking,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/no_inter_net.svg',
                    height: 118,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'No Internet connection',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('Please check your internet connection. It looks like you\'re not connected to the internet.',
                      style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                  const SizedBox(
                    height: 40,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amberAccent)),
                    onPressed: _checkInternetConnection,
                    child: Text("Retry"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _checkInternetConnection() async {
    setState(() {
      _isChecking = true;
    });
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult != ConnectivityResult.none) {
        setState(() {
          _isChecking = false;
        });
      } else {
        await Future.delayed(const Duration(seconds: 2));
        await Connectivity().checkConnectivity();
        setState(() {
          _isChecking = false;
        });
      }
    } catch (e) {
      debugPrint('[NoInterNetWidget][checkInternetConnection] $e');
    }
  }
}
