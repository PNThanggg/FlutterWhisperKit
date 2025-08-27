import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_whisper_kit_platform_interface.dart';

/// An implementation of [FlutterWhisperKitPlatform] that uses method channels.
class MethodChannelFlutterWhisperKit extends FlutterWhisperKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_whisper_kit');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> transcribeAudio(String filePath) async {
    await methodChannel.invokeMethod('transcribeAudio', {'filePath': filePath});
  }
}
