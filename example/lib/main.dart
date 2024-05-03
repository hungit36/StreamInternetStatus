import 'package:check_internet_active_example/no_internet_widget.dart';
import 'package:flutter/material.dart';
import 'package:check_internet_active/check_internet_active.dart';

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
          child: Center(child: Text('Normal Screen')),
        ), offlineChild: const NoInterNetWidget()),
      ),
    );
  }
}
