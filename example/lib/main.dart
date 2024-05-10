import 'package:stream_internet_status/stream_internet_status.dart';
import 'package:flutter/material.dart';
import 'package:stream_internet_status_example/no_internet_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: StreamInternetStatus(onlineChild: Container(
          child: Center(child: Column(
            children: [
              Text('Normal Screen'),
              TextField(),
            ],
          )),
        ), offlineChild: const NoInterNetWidget()),
      ),
    );
  }
}
