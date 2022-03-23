import 'package:flutter/material.dart';
import 'constants.dart';
import 'styling.dart';

class BMI {
  bool flagImperialUnit = false;
  double weightVal = 0;
  double heightVal = 0;
  double BMIVal = 0;
  int BMICategory = 0;
  String BMICategoryLabel = '';
  Color BMIColor = Styling.levelDefault;

  BMI(bool flagImperialUnit, double weightVal, double heightVal) {
    this.flagImperialUnit = flagImperialUnit;
    this.weightVal = weightVal;
    this.heightVal = heightVal;
    calculateBMI();
    categorizeBMI();
  }

  void calculateBMI() {
    double processedWeightVal = 0;
    double processedHeightVal = 0;
    if (this.flagImperialUnit == true) {
      processedWeightVal = this.weightVal * 703;
      processedHeightVal = this.heightVal;
    } else {
      processedWeightVal = this.weightVal;
      processedHeightVal = this.heightVal / 100;
    }
    if (processedWeightVal == 0 || processedHeightVal == 0) {
      this.BMIVal = 0;
    } else {
      this.BMIVal =
          processedWeightVal / (processedHeightVal * processedHeightVal);
    }
  }

  void categorizeBMI() {
    if (0 < this.BMIVal && this.BMIVal < 16) {
      this.BMICategory = -3;
      this.BMICategoryLabel = Constants.BMICategoryLabelMin3;
      this.BMIColor = Styling.levelMin3;
    } else if (16 <= this.BMIVal && this.BMIVal < 17) {
      this.BMICategory = -2;
      this.BMICategoryLabel = Constants.BMICategoryLabelMin2;
      this.BMIColor = Styling.levelMin2;
    } else if (17 <= this.BMIVal && this.BMIVal < 18.5) {
      this.BMICategory = -1;
      this.BMICategoryLabel = Constants.BMICategoryLabelMin1;
      this.BMIColor = Styling.levelMin1;
    } else if (18.5 <= this.BMIVal && this.BMIVal <= 25) {
      this.BMICategory = 0;
      this.BMICategoryLabel = Constants.BMICategoryLabelZero;
      this.BMIColor = Styling.levelZero;
    } else if (25 < this.BMIVal && this.BMIVal <= 30) {
      this.BMICategory = 1;
      this.BMICategoryLabel = Constants.BMICategoryLabelMax1;
      this.BMIColor = Styling.levelMax1;
    } else if (30 < this.BMIVal && this.BMIVal <= 35) {
      this.BMICategory = 2;
      this.BMICategoryLabel = Constants.BMICategoryLabelMax2;
      this.BMIColor = Styling.levelMax2;
    } else if (35 < this.BMIVal && this.BMIVal <= 40) {
      this.BMICategory = 3;
      this.BMICategoryLabel = Constants.BMICategoryLabelMax3;
      this.BMIColor = Styling.levelMax3;
    } else if (40 < this.BMIVal) {
      this.BMICategory = 4;
      this.BMICategoryLabel = Constants.BMICategoryLabelMax4;
      this.BMIColor = Styling.levelMax4;
    } else {
      this.BMICategory = 0;
      this.BMICategoryLabel = "";
      this.BMIColor = Styling.levelDefault;
    }
  }
}
