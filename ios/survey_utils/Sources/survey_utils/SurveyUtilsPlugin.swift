import Flutter
import UIKit
import AVFoundation

public class SurveyUtilsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "survey_utils", binaryMessenger: registrar.messenger())
    let instance = SurveyUtilsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
     if call.method == "getVolume" {
            let volumeLevel = getSystemVolumeLevel()
            result(volumeLevel)
        } else {
            result(FlutterMethodNotImplemented)
        }
  }

  private func getSystemVolumeLevel() -> Float {
        let audioSession = AVAudioSession.sharedInstance()
        let volume = audioSession.outputVolume
        return volume
    }
}
