import 'survey_utils_platform_interface.dart';

class SurveyUtils {
  Future<String?> getPlatformVersion() {
    return SurveyUtilsPlatform.instance.getPlatformVersion();
  }

  static Future<double?> getVolume() {
    return SurveyUtilsPlatform.instance.getVolume();
  }
}
