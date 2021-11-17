#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint device_orientation.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'device_real_orientation'
  s.version          = '0.0.1'
  s.summary          = 'Plugin for get device orientation from sensors'
  s.description      = <<-DESC
Flutter real device orientation
                       DESC
  s.homepage         = 'https://github.com/Lafannn/device_orientation'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Oleh Svidin' => 'oleggog2010@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
