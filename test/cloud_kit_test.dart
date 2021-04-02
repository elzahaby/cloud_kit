import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_kit/cloud_kit.dart';

void main() {
  const MethodChannel channel = MethodChannel('cloud_kit');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await CloudKit.platformVersion, '42');
  });
}
