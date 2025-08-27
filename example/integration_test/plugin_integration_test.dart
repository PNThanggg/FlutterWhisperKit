import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_whisper_kit/flutter_whisper_kit.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getPlatformVersion test', (WidgetTester tester) async {
    final String? version = await FlutterWhisperKit.getPlatformVersion();
    expect(version?.isNotEmpty, true);
  });
}
