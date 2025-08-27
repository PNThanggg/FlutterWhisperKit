import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_whisper_kit_method_channel.dart';

abstract class FlutterWhisperKitPlatform extends PlatformInterface {
  /// Constructs a FlutterWhisperKitPlatform.
  FlutterWhisperKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterWhisperKitPlatform _instance = MethodChannelFlutterWhisperKit();

  /// The default instance of [FlutterWhisperKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterWhisperKit].
  static FlutterWhisperKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterWhisperKitPlatform] when
  /// they register themselves.
  static set instance(FlutterWhisperKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> transcribeAudio(String filePath) {
    throw UnimplementedError('transcribeAudio() has not been implemented.');
  }
}
