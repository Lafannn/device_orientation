import 'package:device_real_orientation/device_orientation.dart';
import 'package:flutter/services.dart' show EventChannel;

class DeviceOrientationProvider {
  static const EventChannel _eventChannel =
      EventChannel('device_orientation_plugin/device_orientations');

  static final orientations = _eventChannel
      .receiveBroadcastStream()
      .cast<int>()
      .map((index) => DeviceOrientation.values[index]);
}
