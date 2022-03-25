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
  
  final int imperialWeightMultiplier = 703;
  final int metricHeightDivisor = 100;
  final double BMILevelMin3LowerLimit = 0;
  final double BMILevelMin3UpperLimit = 16;
  final double BMILevelMin2UpperLimit = 17;
  final double BMILevelMin1UpperLimit = 18.5;
  final double BMILevelZeroUpperLimit = 25;
  final double BMILevelMax1UpperLimit = 30;
  final double BMILevelMax2UpperLimit = 35;
  final double BMILevelMax3UpperLimit = 40;

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
      processedWeightVal = this.weightVal * this.imperialWeightMultiplier;
      processedHeightVal = this.heightVal;
    } else {
      processedWeightVal = this.weightVal;
      processedHeightVal = this.heightVal / this.metricHeightDivisor;
    }
    if (processedWeightVal == 0 || processedHeightVal == 0) {
      this.BMIVal = 0;
    } else {
      this.BMIVal =
          processedWeightVal / (processedHeightVal * processedHeightVal);
    }
  }

  void categorizeBMI() {
    if (this.BMILevelMin3LowerLimit < this.BMIVal && this.BMIVal < this.BMILevelMin3UpperLimit) {
      this.BMICategory = -3;
      this.BMICategoryLabel = Constants.BMICategoryLabelMin3;
      this.BMIColor = Styling.levelMin3;
    } else if (this.BMILevelMin3UpperLimit <= this.BMIVal && this.BMIVal < this.BMILevelMin2UpperLimit) {
      this.BMICategory = -2;
      this.BMICategoryLabel = Constants.BMICategoryLabelMin2;
      this.BMIColor = Styling.levelMin2;
    } else if (this.BMILevelMin2UpperLimit <= this.BMIVal && this.BMIVal < this.BMILevelMin1UpperLimit) {
      this.BMICategory = -1;
      this.BMICategoryLabel = Constants.BMICategoryLabelMin1;
      this.BMIColor = Styling.levelMin1;
    } else if (this.BMILevelMin1UpperLimit <= this.BMIVal && this.BMIVal <= this.BMILevelZeroUpperLimit) {
      this.BMICategory = 0;
      this.BMICategoryLabel = Constants.BMICategoryLabelZero;
      this.BMIColor = Styling.levelZero;
    } else if (this.BMILevelZeroUpperLimit < this.BMIVal && this.BMIVal <= this.BMILevelMax1UpperLimit) {
      this.BMICategory = 1;
      this.BMICategoryLabel = Constants.BMICategoryLabelMax1;
      this.BMIColor = Styling.levelMax1;
    } else if (this.BMILevelMax1UpperLimit < this.BMIVal && this.BMIVal <= this.BMILevelMax2UpperLimit) {
      this.BMICategory = 2;
      this.BMICategoryLabel = Constants.BMICategoryLabelMax2;
      this.BMIColor = Styling.levelMax2;
    } else if (this.BMILevelMax2UpperLimit < this.BMIVal && this.BMIVal <= this.BMILevelMax3UpperLimit) {
      this.BMICategory = 3;
      this.BMICategoryLabel = Constants.BMICategoryLabelMax3;
      this.BMIColor = Styling.levelMax3;
    } else if (this.BMILevelMax3UpperLimit < this.BMIVal) {
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
