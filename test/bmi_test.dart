import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bmi_app/bmi.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/styling.dart';

void main() {
  test('Metric, Zero Values, BMICategory Test', () {
    var expected = 0;
    BMI testBMI = new BMI(false, 0, 0);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Metric, Zero Values, BMIColor Test', () {
    Color expected = Styling.levelDefault;
    BMI testBMI = new BMI(false, 0, 0);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Metric, Severe Thinness, BMICategory Test', () {
    var expected = -3;
    BMI testBMI = new BMI(false, 45, 170);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Metric, Severe Thinness, BMIColor Test', () {
    Color expected = Styling.levelMin3;
    BMI testBMI = new BMI(false, 45, 170);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Metric, Moderate Thinness, BMICategory Test', () {
    var expected = -2;
    BMI testBMI = new BMI(false, 48, 170);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Metric, Moderate Thinness, BMIColor Test', () {
    Color expected = Styling.levelMin2;
    BMI testBMI = new BMI(false, 48, 170);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Metric, Mild Thinness, BMICategory Test', () {
    var expected = -1;
    BMI testBMI = new BMI(false, 52, 170);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Metric, Mild Thinness, BMIColor Test', () {
    Color expected = Styling.levelMin1;
    BMI testBMI = new BMI(false, 52, 170);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Metric, Normal, BMICategory Test', () {
    var expected = 0;
    BMI testBMI = new BMI(false, 55, 170);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Metric, Normal, BMIColor Test', () {
    Color expected = Styling.levelZero;
    BMI testBMI = new BMI(false, 55, 170);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Metric, Overweight, BMICategory Test', () {
    var expected = 1;
    BMI testBMI = new BMI(false, 80, 170);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Metric, Overweight, BMIColor Test', () {
    Color expected = Styling.levelMax1;
    BMI testBMI = new BMI(false, 80, 170);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Metric, Obese Class I, BMICategory Test', () {
    var expected = 2;
    BMI testBMI = new BMI(false, 90, 170);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Metric, Obese Class I, BMIColor Test', () {
    Color expected = Styling.levelMax2;
    BMI testBMI = new BMI(false, 90, 170);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Metric, Obese Class II, BMICategory Test', () {
    var expected = 3;
    BMI testBMI = new BMI(false, 110, 170);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Metric, Obese Class II, BMIColor Test', () {
    Color expected = Styling.levelMax3;
    BMI testBMI = new BMI(false, 110, 170);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Metric, Obese Class III, BMICategory Test', () {
    var expected = 4;
    BMI testBMI = new BMI(false, 120, 170);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Metric, Obese Class III, BMIColor Test', () {
    Color expected = Styling.levelMax4;
    BMI testBMI = new BMI(false, 120, 170);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Imperial, Zero Values, BMICategory Test', () {
    var expected = 0;
    BMI testBMI = new BMI(true, 0, 0);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Imperial, Zero Values, BMIColor Test', () {
    Color expected = Styling.levelDefault;
    BMI testBMI = new BMI(true, 0, 0);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Imperial, Severe Thinness, BMICategory Test', () {
    var expected = -3;
    BMI testBMI = new BMI(true, 99, 67);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Imperial, Severe Thinness, BMIColor Test', () {
    Color expected = Styling.levelMin3;
    BMI testBMI = new BMI(true, 99, 67);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Imperial, Moderate Thinness, BMICategory Test', () {
    var expected = -2;
    BMI testBMI = new BMI(true, 105, 67);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Imperial, Moderate Thinness, BMIColor Test', () {
    Color expected = Styling.levelMin2;
    BMI testBMI = new BMI(true, 105, 67);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Imperial, Mild Thinness, BMICategory Test', () {
    var expected = -1;
    BMI testBMI = new BMI(true, 114, 67);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Imperial, Mild Thinness, BMIColor Test', () {
    Color expected = Styling.levelMin1;
    BMI testBMI = new BMI(true, 114, 67);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Imperial, Normal, BMICategory Test', () {
    var expected = 0;
    BMI testBMI = new BMI(true, 121, 67);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Imperial, Normal, BMIColor Test', () {
    Color expected = Styling.levelZero;
    BMI testBMI = new BMI(true, 121, 67);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Imperial, Overweight, BMICategory Test', () {
    var expected = 1;
    BMI testBMI = new BMI(true, 176, 67);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Imperial, Overweight, BMIColor Test', () {
    Color expected = Styling.levelMax1;
    BMI testBMI = new BMI(true, 176, 67);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Imperial, Obese Class I, BMICategory Test', () {
    var expected = 2;
    BMI testBMI = new BMI(true, 198, 67);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Imperial, Obese Class I, BMIColor Test', () {
    Color expected = Styling.levelMax2;
    BMI testBMI = new BMI(true, 198, 67);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Imperial, Obese Class II, BMICategory Test', () {
    var expected = 3;
    BMI testBMI = new BMI(true, 242, 67);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Imperial, Obese Class II, BMIColor Test', () {
    Color expected = Styling.levelMax3;
    BMI testBMI = new BMI(true, 242, 67);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
  test('Imperial, Obese Class III, BMICategory Test', () {
    var expected = 4;
    BMI testBMI = new BMI(true, 265, 67);
    var actual = testBMI.BMICategory;
    expect(actual, expected);
  });
  test('Imperial, Obese Class III, BMIColor Test', () {
    Color expected = Styling.levelMax4;
    BMI testBMI = new BMI(true, 265, 67);
    Color actual = testBMI.BMIColor;
    expect(actual, expected);
  });
}
