import Flutter
import UIKit

public class SwiftDeviceOrientationPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let eventChannel = FlutterEventChannel(name: "device_orientation_plugin/device_orientations", binaryMessenger: registrar.messenger())
        eventChannel.setStreamHandler(OrientationsStreamHandler())
    }
}
