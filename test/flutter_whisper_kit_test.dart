import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_whisper_kit/flutter_whisper_kit.dart';
import 'package:flutter_whisper_kit/flutter_whisper_kit_platform_interface.dart';
import 'package:flutter_whisper_kit/flutter_whisper_kit_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterWhisperKitPlatform with MockPlatformInterfaceMixin implements FlutterWhisperKitPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> transcribeAudio(String filePath) {
    return Future.value();
  }
}

void main() {
  final FlutterWhisperKitPlatform initialPlatform = FlutterWhisperKitPlatform.instance;

  test('$MethodChannelFlutterWhisperKit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterWhisperKit>());
  });

  test('getPlatformVersion', () async {
    MockFlutterWhisperKitPlatform fakePlatform = MockFlutterWhisperKitPlatform();
    FlutterWhisperKitPlatform.instance = fakePlatform;

    expect(await FlutterWhisperKit.getPlatformVersion(), '42');
  });
}
