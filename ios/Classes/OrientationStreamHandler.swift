//
//  OrientationStreamHandler.swift
//  device_orientation
//
//  Created by Oleg Svidin on 17.11.2021.
//

import Foundation

class OrientationsStreamHandler : NSObject, FlutterStreamHandler{
    var eventSink: FlutterEventSink?
    var lastValue = 1;
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(rotated),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        NotificationCenter.default.removeObserver(self)
        return nil
    }
    
    @objc func rotated(){
        UIDeviceOrientation
        let newValue = UIDevice.current.orientation.rawValue
        if(newValue < 5 && newValue != lastValue){
            lastValue = newValue
            eventSink!(UIDevice.current.orientation.rawValue)
        }
    }
}
