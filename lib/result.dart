import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'styling.dart';
import 'viewmodel.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the last data from viewmodel.
    ViewModel vm = new ViewModel();
    String BMIVal = vm.getLastBMIVal().toStringAsFixed(2);
    String BMICategoryLabel = vm.getLastBMICategoryLabel();
    Color BMIColor = vm.getLastBMIColor();

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appTitle),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: Styling.verticalGapSmall),
          Text(Constants.subtitleResult,
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: Styling.verticalGapSmall),
          Text(BMIVal,
              style: TextStyle(color: BMIColor, fontWeight: FontWeight.bold)),
          const SizedBox(height: Styling.verticalGapMedium),
          Text(
            Constants.textResultCategoryLabel,
          ),
          const SizedBox(height: Styling.verticalGapSmall),
          Text(BMICategoryLabel,
              style: TextStyle(
                color: BMIColor,
              )),
          const SizedBox(height: Styling.verticalGapSmall),
          Text(
            Constants.textResultDescription,
          ),
          const SizedBox(height: Styling.verticalGapMedium),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(Constants.btnLabelReturn),
          ),
        ],
      )),
    );
  }
}
