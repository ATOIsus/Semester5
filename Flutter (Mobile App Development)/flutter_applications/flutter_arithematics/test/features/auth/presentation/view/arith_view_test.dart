import 'package:flutter/material.dart';
import 'package:flutter_arithematics/features/auth/presentation/view/arith_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget testing of arith view', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ArithView(),
      ),
    );

    //Wait for the above function to render.
    await tester.pumpAndSettle();

    //Integer cannot be given only string
    //Index number should be given for multiple widgets.

    await tester.enterText(find.byType(TextFormField).first, '2');
    await tester.enterText(find.byType(TextFormField).last, '3');

    await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));

    //Wait for the scaffold to rebuild // setState() was used.
    await tester.pumpAndSettle();

    expect(find.text('Result: 5'), findsOneWidget);

    //expect(find.text('Arith'), findsOneWidget);
  });

  testWidgets('Widget testing of arith view for subtraction', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ArithView(),
      ),
    );

    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, '2');
    await tester.enterText(find.byType(TextFormField).last, '3');

    await tester.tap(find.widgetWithText(ElevatedButton, 'Subtract'));

    await tester.pumpAndSettle();

    //Another screen is opened.
    expect(find.text('Result'), findsOneWidget);
  });
}
