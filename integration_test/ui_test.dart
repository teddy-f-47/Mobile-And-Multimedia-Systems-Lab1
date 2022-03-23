import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';

import 'package:bmi_app/main.dart' as app;
import 'package:bmi_app/constants.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('initial condition test', () {
    testWidgets('', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify that our app starts from with a blank slate.
      expect(find.text(Constants.textBMIValue), findsOneWidget);

      // Verify the menu button is available.
      var menuButton = find.byIcon(Icons.more_vert);
      expect(menuButton, findsOneWidget);

      // Verify the weight input field is available.
      var inputWeight = find.text(Constants.textWeightInputLabel);
      expect(inputWeight, findsOneWidget);

      // Verify the height input field is available.
      var inputHeight = find.text(Constants.textHeightInputLabel);
      expect(inputHeight, findsOneWidget);

      // Verify the count button is available.
      var countButton = find.text(Constants.btnLabelCount);
      expect(countButton, findsOneWidget);

      // Emulate a tap on the count button.
      await tester.tap(countButton);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the warning message is shown.
      var warningMessage = find.byType(Dialog);
      expect(warningMessage, findsOneWidget);
    });
  });

  group('change to imperial unit test', () {
    testWidgets('', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify that our app starts from with a blank slate.
      expect(find.text(Constants.textBMIValue), findsOneWidget);

      // Verify the menu button is available.
      var menuButton = find.byIcon(Icons.more_vert);
      expect(menuButton, findsOneWidget);

      // Emulate a tap on the menu button.
      await tester.tap(menuButton);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the menu option is available.
      var imperialButton = find.text(Constants.menuLabelImperial);
      expect(imperialButton, findsOneWidget);

      // Emulate a tap on the menu option.
      await tester.tap(imperialButton);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the labels has changed.
      expect(find.text(Constants.textWeightLabelImperial), findsOneWidget);
      expect(find.text(Constants.textHeightLabelImperial), findsOneWidget);

      // Try entering weight.
      var inputWeight = find.byKey(new Key(Constants.inputWeightValKey));
      expect(inputWeight, findsOneWidget);
      await tester.pump(Duration(milliseconds: 500));
      await tester.enterText(inputWeight, "121");

      // Try entering height.
      var inputHeight = find.byKey(new Key(Constants.inputHeightValKey));
      expect(inputHeight, findsOneWidget);
      await tester.pump(Duration(milliseconds: 500));
      await tester.enterText(inputHeight, "67");

      // Verify the count button is available.
      var countButton = find.text(Constants.btnLabelCount);
      expect(countButton, findsOneWidget);

      // Emulate a tap on the count button.
      await tester.tap(countButton);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the BMI text has changed.
      expect(find.text(Constants.textBMIValue), findsNothing);
    });
  });

  group('change to metric unit test', () {
    testWidgets('', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify that our app starts from with a blank slate.
      expect(find.text(Constants.textBMIValue), findsOneWidget);

      // Verify the menu button is available.
      var menuButton = find.byIcon(Icons.more_vert);
      expect(menuButton, findsOneWidget);

      // Emulate a tap on the menu button.
      await tester.tap(menuButton);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the menu option is available.
      var metricButton = find.text(Constants.menuLabelMetric);
      expect(metricButton, findsOneWidget);

      // Emulate a tap on the menu option.
      await tester.tap(metricButton);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the labels has changed.
      expect(find.text(Constants.textWeightLabelMetric), findsOneWidget);
      expect(find.text(Constants.textHeightLabelMetric), findsOneWidget);

      // Try entering weight.
      var inputWeight = find.byKey(new Key(Constants.inputWeightValKey));
      expect(inputWeight, findsOneWidget);
      await tester.pump(Duration(milliseconds: 500));
      await tester.enterText(inputWeight, "55");

      // Try entering height.
      var inputHeight = find.byKey(new Key(Constants.inputHeightValKey));
      expect(inputHeight, findsOneWidget);
      await tester.pump(Duration(milliseconds: 500));
      await tester.enterText(inputHeight, "170");

      // Verify the count button is available.
      var countButton = find.text(Constants.btnLabelCount);
      expect(countButton, findsOneWidget);

      // Emulate a tap on the count button.
      await tester.tap(countButton);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the BMI text has changed.
      expect(find.text(Constants.textBMIValue), findsNothing);
    });
  });

  group('see about author test', () {
    testWidgets('', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify that our app starts from with a blank slate.
      expect(find.text(Constants.textBMIValue), findsOneWidget);

      // Verify the menu button is available.
      var menuButton = find.byIcon(Icons.more_vert);
      expect(menuButton, findsOneWidget);

      // Emulate a tap on the menu button.
      await tester.tap(menuButton);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the menu option is available.
      var aboutButton = find.text(Constants.menuLabelAbout);
      expect(aboutButton, findsOneWidget);

      // Emulate a tap on the menu option.
      await tester.tap(aboutButton);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the text from the About class has appeared.
      expect(find.text(Constants.subtitleAbout), findsOneWidget);
      expect(find.text(Constants.textAbout), findsOneWidget);

      // Verify the return button is available.
      var returnButton = find.text(Constants.btnLabelReturn);
      expect(returnButton, findsOneWidget);

      // Emulate a tap on the return button.
      await tester.tap(returnButton);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify it has come back to the home page.
      var countButton = find.text(Constants.btnLabelCount);
      expect(countButton, findsOneWidget);
    });
  });
}
