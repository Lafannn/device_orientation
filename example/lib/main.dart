import 'package:device_real_orientation/device_orientation.dart';
import 'package:flutter/material.dart';
import 'package:device_real_orientation/device_orientation_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var orientation = DeviceOrientation.portrait;

  @override
  void initState() {
    super.initState();
    DeviceOrientationProvider.orientations.listen((orientation) {
      setState(() {
        this.orientation = orientation;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Orientation: $orientation'),
        ),
      ),
    );
  }
}
