
import 'flutter_whisper_kit_platform_interface.dart';

abstract class FlutterWhisperKit {
  static Future<String?> getPlatformVersion() {
    return FlutterWhisperKitPlatform.instance.getPlatformVersion();
  }

  static Future<void> transcribeAudio(String filePath) {
    return FlutterWhisperKitPlatform.instance.transcribeAudio(filePath);
  }
}
