import 'package:example/pinput_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:example/main.dart' as app;

void main() {
  patrolTest("Pin view", nativeAutomation: true, (PatrolTester $) async {
    await Future.delayed(const Duration(seconds: 2));
    await app.main();
    await $.pump(const Duration(seconds: 1));
    await $(PinPage).waitUntilVisible();
    expect($(PinPage), findsOneWidget);
    await $(#pin).tap();
    await $.pump(const Duration(seconds: 1));
    // Tried this method as well, but it didn't work
    // await $(#pin).enterText("1234");
    TestTextInput().enterText("1234");
    await $.pump(const Duration(seconds: 5));
  });
}
