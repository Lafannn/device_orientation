#import "DeviceOrientationPlugin.h"
#if __has_include(<device_real_orientation/device_real_orientation-Swift.h>)
#import <device_real_orientation/device_real_orientation-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "device_real_orientation-Swift.h"
#endif

@implementation DeviceOrientationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceOrientationPlugin registerWithRegistrar:registrar];
}
@end
