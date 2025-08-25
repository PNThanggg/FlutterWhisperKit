
import 'flutter_whisper_kit_platform_interface.dart';

class FlutterWhisperKit {
  Future<String?> getPlatformVersion() {
    return FlutterWhisperKitPlatform.instance.getPlatformVersion();
  }
}
