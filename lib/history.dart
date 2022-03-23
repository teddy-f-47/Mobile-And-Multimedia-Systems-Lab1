import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'styling.dart';
import 'viewmodel.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check how many saved data.
    ViewModel vm = new ViewModel();
    int countSaveData = vm.getSaveDataLength();

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appTitle),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(Constants.menuLabelHistory,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: Styling.verticalGapSmall),
                    ListView.separated(
                      // Build a list child as many as X times, where X = countSaveData.
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: countSaveData,
                      itemBuilder: (BuildContext context, int index) {
                        bool flagImperialUnit = vm.getFlagImperialUnit(index);
                        String weightValLabel;
                        String heightValLabel;
                        if (flagImperialUnit) {
                          weightValLabel = Constants.textWeightLabelImperial;
                          heightValLabel = Constants.textHeightLabelImperial;
                        } else {
                          weightValLabel = Constants.textWeightLabelMetric;
                          heightValLabel = Constants.textHeightLabelMetric;
                        }
                        String weightVal =
                            vm.getWeightVal(index).toStringAsFixed(2);
                        String heightVal =
                            vm.getHeightVal(index).toStringAsFixed(2);
                        String BMIVal = vm.getBMIVal(index).toStringAsFixed(2);
                        String BMICategoryLabel = vm.getBMICategoryLabel(index);
                        Color BMIColor = vm.getBMIColor(index);
                        return Container(
                          child: new Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(weightValLabel,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(weightVal),
                                  Text(heightValLabel,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(heightVal),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(Constants.textBMIValue,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(BMIVal,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: BMIColor)),
                                  Text(BMICategoryLabel,
                                      style: TextStyle(color: BMIColor)),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
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
        },
      ),
    );
  }
}
