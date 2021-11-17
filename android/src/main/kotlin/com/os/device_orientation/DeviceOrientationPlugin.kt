package com.os.device_orientation
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel

/** DeviceOrientationPlugin */
class DeviceOrientationPlugin: FlutterPlugin {
  private  lateinit var eventChannel: EventChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "device_orientation_plugin/device_orientations")
    eventChannel.setStreamHandler(OrientationsStreamHandler(flutterPluginBinding.applicationContext))
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    eventChannel.setStreamHandler(null)
  }
}


