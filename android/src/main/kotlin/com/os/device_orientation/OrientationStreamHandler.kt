package com.os.device_orientation

import android.content.Context
import android.view.OrientationEventListener
import io.flutter.plugin.common.EventChannel

class OrientationsStreamHandler(private var context: Context) : EventChannel.StreamHandler {
    private lateinit var orientationListener: OrientationEventListener
    private var currentOrientation = Orientation.Portrait

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        orientationListener = object : OrientationEventListener(context) {
            override fun onOrientationChanged(orientation: Int) {
                if (orientation == -1)
                    return

                when (currentOrientation) {
                    Orientation.Portrait -> currentOrientation = when (orientation) {
                        in 70..160 -> Orientation.LandscapeRight
                        in 160..200 -> Orientation.UpsideDown
                        in 200..290 -> Orientation.LandscapeLeft
                        else -> return

                    }
                    Orientation.LandscapeRight -> currentOrientation = when (orientation) {
                        in 0..20 -> Orientation.Portrait
                        in 290..360 -> Orientation.Portrait
                        in 160..250 -> Orientation.UpsideDown
                        in 250..290 -> Orientation.LandscapeLeft
                        else -> return
                    }
                    Orientation.LandscapeLeft -> currentOrientation = when (orientation) {
                        in 340..360 -> Orientation.Portrait
                        in 0..70 -> Orientation.Portrait
                        in 70..110 -> Orientation.LandscapeRight
                        in 110..200 -> Orientation.UpsideDown
                        else -> return
                    }
                    Orientation.UpsideDown -> currentOrientation = when (orientation) {
                        in 340..360 -> Orientation.Portrait
                        in 0..20 -> Orientation.Portrait
                        in 20..110 -> Orientation.LandscapeRight
                        in 250..340 -> Orientation.LandscapeLeft
                        else -> return
                    }
                }
                events?.success(currentOrientation.index)
            }
        }
        orientationListener.enable()
    }

    override fun onCancel(arguments: Any?) {
        orientationListener.disable()
    }
}