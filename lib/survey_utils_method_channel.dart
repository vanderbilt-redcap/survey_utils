import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'survey_utils_platform_interface.dart';

/// An implementation of [SurveyUtilsPlatform] that uses method channels.
class MethodChannelSurveyUtils extends SurveyUtilsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('survey_utils');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<double?> getVolume() async {
    double? volume = await methodChannel.invokeMethod<double>('getVolume');
    return volume;
  }
}
