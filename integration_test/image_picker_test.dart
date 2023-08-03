import 'package:example/image_select.ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:example/main.dart' as app;

void main() {
  patrolTest("Image pick", nativeAutomation: true, (PatrolTester $) async {
    await Future.delayed(const Duration(seconds: 2));
    await app.main();
    await $.pump(const Duration(seconds: 1));
    await $(PickImagePage).waitUntilVisible();
    expect($(PickImagePage), findsOneWidget);
    await $(ElevatedButton).tap();
    final list = await $.native.getNativeViews(
      Selector(
        resourceId: "com.google.android.documentsui:id/thumbnail",
      ),
    );
    final list2 = await $.native.getNativeViews(
      Selector(
        resourceId: "com.android.documentsui:id/thumbnail",
      ),
    );
    print(list);
    print(list2);
    if (list.isNotEmpty) {
      print("Tap 1st");
      await $.native.tap(
        Selector(
          resourceId: "com.google.android.documentsui:id/thumbnail",
        ),
      );
    } else if (list2.isNotEmpty) {
      print("Tap 2nd");
      await $.native
          .tap(Selector(resourceId: "com.android.documentsui:id/thumbnail"));
    }
    await Future.delayed(Duration(seconds: 2));
    // print("After tap");
    await $.pumpAndSettle();
  });
}
