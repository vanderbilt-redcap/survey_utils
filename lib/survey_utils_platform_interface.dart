import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'survey_utils_method_channel.dart';

abstract class SurveyUtilsPlatform extends PlatformInterface {
  /// Constructs a SurveyUtilsPlatform.
  SurveyUtilsPlatform() : super(token: _token);

  static final Object _token = Object();

  static SurveyUtilsPlatform _instance = MethodChannelSurveyUtils();

  /// The default instance of [SurveyUtilsPlatform] to use.
  ///
  /// Defaults to [MethodChannelSurveyUtils].
  static SurveyUtilsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SurveyUtilsPlatform] when
  /// they register themselves.
  static set instance(SurveyUtilsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<double?> getVolume() {
    throw UnimplementedError('getVolume has not been implemented.');
  }
}
