package edu.vandebilt.survey_utils

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.media.AudioManager
import android.content.Context

/** SurveyUtilsPlugin */
class SurveyUtilsPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context : Context;

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "survey_utils")
    context = flutterPluginBinding.getApplicationContext();
    channel.setMethodCallHandler(this)

  }

  private fun audioManager(): AudioManager {
      return context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
  }

  fun getVolume(type: Int = AudioManager.STREAM_MUSIC): Float {
      val audioManager = audioManager()
      val max = audioManager.getStreamMaxVolume(type).toFloat()
      val vol = audioManager.getStreamVolume(type).toFloat()
      return vol / max
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } 
    else if(call.method == "getVolume"){
      result.success(getVolume())
    }
    else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
