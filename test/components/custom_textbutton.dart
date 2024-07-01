import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_stock/components/custom_textbutton.dart';

void main() {
  testWidgets('CustomTextButton creates without error',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomTextButton(
          title: 'Test Button',
          onTap: () {},
        ),
      ),
    ));

    expect(find.byType(CustomTextButton), findsOneWidget);
  });

  testWidgets('CustomTextButton onTap callback is triggered',
      (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomTextButton(
          title: 'Test Button',
          onTap: () {
            tapped = true;
          },
        ),
      ),
    ));

    await tester.tap(find.byType(CustomTextButton));
    expect(tapped, true);
  });

  testWidgets('CustomTextButton displays title', (WidgetTester tester) async {
    const title = 'Test Button';

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomTextButton(
          title: title,
          onTap: () {},
        ),
      ),
    ));

    expect(find.text(title), findsOneWidget);
  });

  testWidgets('CustomTextButton displays icon when provided',
      (WidgetTester tester) async {
    const title = 'Test Button';

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomTextButton(
          title: title,
          icon: Icons.home,
          onTap: () {},
        ),
      ),
    ));

    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets('CustomTextButton hide icon when not provided',
      (WidgetTester tester) async {
    const title = 'Test Button';

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomTextButton(
          title: title,
          onTap: () {},
        ),
      ),
    ));

    expect(find.byIcon(Icons.home), findsNothing);
  });
}
