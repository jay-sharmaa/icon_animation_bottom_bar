import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icon_animation_bottom_bar/icon_animation_bottom_bar.dart';

void main() {
  testWidgets('MyWidget shows correct text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: IconAnimationBottomBar()
        ),
      ),
    );
    expect(find.text('Hello Flutter'), findsOneWidget);
  });
}