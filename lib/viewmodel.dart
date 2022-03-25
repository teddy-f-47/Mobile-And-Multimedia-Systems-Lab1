import 'package:flutter/material.dart';
import 'constants.dart';
import 'styling.dart';
import 'bmi.dart';
import 'storage.dart';

class ViewModel {
  final Storage _myStorage = new Storage();
  final String _saveDataKey = 'saveData';
  final String _saveDataSlotSeparator = '/';
  final String _saveDataItemSeparator = '-';
  final int _maxSaveDataSlots = 10;

  void saveBMI(bool flagImperialUnit, double weightVal, double heightVal) {
    String strFlagImperialUnit = (flagImperialUnit) ? "1" : "0";
    String strWeightVal = weightVal.toStringAsFixed(2);
    String strHeightVal = heightVal.toStringAsFixed(2);
    String currentMeasurement = strFlagImperialUnit +
        _saveDataItemSeparator +
        strWeightVal +
        _saveDataItemSeparator +
        strHeightVal;

    List<String> saveData = _getListSaveData();
    if (saveData.length == 0) {
      _myStorage.putSaveDataString(this._saveDataKey, currentMeasurement);
    }
    if (saveData.length >= _maxSaveDataSlots) {
      saveData.removeAt(0);
    }
    saveData.add(currentMeasurement);
    String newSaveData = saveData.join(_saveDataSlotSeparator);
    _myStorage.putSaveDataString(this._saveDataKey, newSaveData);
  }

  List<String> _getListSaveData() {
    String saveDataString = _myStorage.getSaveDataString(this._saveDataKey);
    List<String> saveData = saveDataString.split(_saveDataSlotSeparator);
    return saveData;
  }

  BMI _getLastBMI() {
	List<String> saveData = _getListSaveData();
	int saveDataIndex = saveData.length - 1;
	
    return _getBMIAtSlot(saveDataIndex);
  }

  bool getLastFlagImperialUnit() {
    BMI lastBMI = _getLastBMI();
    return lastBMI.flagImperialUnit;
  }

  double getLastWeightVal() {
    BMI lastBMI = _getLastBMI();
    return lastBMI.weightVal;
  }

  double getLastHeightVal() {
    BMI lastBMI = _getLastBMI();
    return lastBMI.heightVal;
  }

  double getLastBMIVal() {
    BMI lastBMI = _getLastBMI();
    return lastBMI.BMIVal;
  }

  int getLastBMICategory() {
    BMI lastBMI = _getLastBMI();
    return lastBMI.BMICategory;
  }

  String getLastBMICategoryLabel() {
    BMI lastBMI = _getLastBMI();
    return lastBMI.BMICategoryLabel;
  }

  Color getLastBMIColor() {
    BMI lastBMI = _getLastBMI();
    return lastBMI.BMIColor;
  }

  int getSaveDataLength() {
    List<String> saveData = _getListSaveData();
    return saveData.length;
  }

  BMI _getBMIAtSlot(int index) {
    List<String> saveData = _getListSaveData();
    BMI output = new BMI(false, 0, 0);

    if (saveData.length != 0 && saveData.length > index && index >= 0) {
      String saveDataItemString = saveData[index];
      if (saveDataItemString != '') {
        List<String> saveDataItem =
            saveDataItemString.split(_saveDataItemSeparator);
        bool flagImperialUnit = (saveDataItem[0] == "1") ? true : false;
        double weightVal = double.parse(saveDataItem[1]);
        double heightVal = double.parse(saveDataItem[2]);
        output = new BMI(flagImperialUnit, weightVal, heightVal);
      }
    }

    return output;
  }

  bool getFlagImperialUnit(int index) {
    BMI selectedBMI = _getBMIAtSlot(index);
    return selectedBMI.flagImperialUnit;
  }

  double getWeightVal(int index) {
    BMI selectedBMI = _getBMIAtSlot(index);
    return selectedBMI.weightVal;
  }

  double getHeightVal(int index) {
    BMI selectedBMI = _getBMIAtSlot(index);
    return selectedBMI.heightVal;
  }

  double getBMIVal(int index) {
    BMI selectedBMI = _getBMIAtSlot(index);
    return selectedBMI.BMIVal;
  }

  int getBMICategory(int index) {
    BMI selectedBMI = _getBMIAtSlot(index);
    return selectedBMI.BMICategory;
  }

  String getBMICategoryLabel(int index) {
    BMI selectedBMI = _getBMIAtSlot(index);
    return selectedBMI.BMICategoryLabel;
  }

  Color getBMIColor(int index) {
    BMI selectedBMI = _getBMIAtSlot(index);
    return selectedBMI.BMIColor;
  }
}
