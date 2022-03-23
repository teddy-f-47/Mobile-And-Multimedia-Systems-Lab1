import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'styling.dart';
import 'about.dart';
import 'result.dart';
import 'history.dart';
import 'viewmodel.dart';

void main() => runApp(const MyBMIApp());

class MyBMIApp extends StatelessWidget {
  const MyBMIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyBMICustomForm(),
    );
  }
}

class MyBMICustomForm extends StatefulWidget {
  const MyBMICustomForm({Key? key}) : super(key: key);

  @override
  _MyBMICustomFormState createState() => _MyBMICustomFormState();
}

class _MyBMICustomFormState extends State<MyBMICustomForm> {
  // Define controllers for capturing inputs from textfields.
  final weightValController = TextEditingController();
  final heightValController = TextEditingController();

  // Variables following the current state.
  bool flagImperialUnit = false;
  String textWeightLabel = Constants.textWeightLabelMetric;
  String textHeightLabel = Constants.textHeightLabelMetric;
  String textBMIValue = Constants.textBMIValue;
  Color textBMIColor = Styling.levelDefault;

  void initializeViewModel() {
    // Create a viewmodel to trigger the storage to load.
    ViewModel vm = new ViewModel();
  }

  void handleMenuClick(int item) {
    // For handling the menu options.
    switch (item) {
      case 0:
        flagImperialUnit = false;
        textWeightLabel = Constants.textWeightLabelMetric;
        textHeightLabel = Constants.textHeightLabelMetric;
        break;
      case 1:
        flagImperialUnit = true;
        textWeightLabel = Constants.textWeightLabelImperial;
        textHeightLabel = Constants.textHeightLabelImperial;
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const History()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const About()),
        );
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    initializeViewModel();
  }

  @override
  void dispose() {
    // For cleaning up the controllers when the widget is disposed.
    super.dispose();
    weightValController.dispose();
    heightValController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Constants.appTitle),
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: (item) => handleMenuClick(item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                    value: 0, child: Text(Constants.menuLabelMetric)),
                PopupMenuItem<int>(
                    value: 1, child: Text(Constants.menuLabelImperial)),
                PopupMenuItem<int>(
                    value: 2, child: Text(Constants.menuLabelHistory)),
                PopupMenuItem<int>(
                    value: 3, child: Text(Constants.menuLabelAbout)),
              ],
            ),
          ],
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: Styling.verticalGapSmall),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(textWeightLabel,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(
                width: MediaQuery.of(context).size.width *
                    Styling.inputWidthRelative,
                child: TextFormField(
                  key: new Key(Constants.inputWeightValKey),
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: Constants.textWeightInputLabel),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: weightValController,
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(textHeightLabel,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(
                width: MediaQuery.of(context).size.width *
                    Styling.inputWidthRelative,
                child: TextFormField(
                  key: new Key(Constants.inputHeightValKey),
                  decoration: new InputDecoration(
                      labelText: Constants.textHeightInputLabel),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: heightValController,
                )),
            const SizedBox(height: Styling.verticalGapMedium),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(Styling.buttonHeight),
              ),
              onPressed: () {
                var evalWeightVal = double.tryParse(weightValController.text);
                var evalHeightVal = double.tryParse(heightValController.text);
                bool formValid = true;
                String _alertMessage = "";
                if (evalWeightVal == null || evalWeightVal == 0) {
                  formValid = false;
                  _alertMessage = _alertMessage + Constants.textAlertWeight;
                }
                if (evalHeightVal == null || evalHeightVal == 0) {
                  formValid = false;
                  _alertMessage = _alertMessage + Constants.textAlertHeight;
                }

                if (formValid == true) {
                  // Try to save the data.
                  ViewModel vm = new ViewModel();
                  vm.saveBMI(
                      flagImperialUnit,
                      double.parse(weightValController.text),
                      double.parse(heightValController.text));

                  // Get the last measurement from viewmodel.
                  String newTextBMIValue =
                      vm.getLastBMIVal().toStringAsFixed(2);
                  Color newTextBMIColor = vm.getLastBMIColor();

                  // Set current state based on the last measurement.
                  setState(() {
                    textBMIValue = newTextBMIValue;
                    textBMIColor = newTextBMIColor;
                  });
                } else {
                  // Invalid data, show a warning message.
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(_alertMessage),
                      );
                    },
                  );

                  // Reset current state to use default values.
                  setState(() {
                    textBMIValue = Constants.textBMIValue;
                    textBMIColor = Styling.levelDefault;
                  });
                }
              },
              child: const Text(Constants.btnLabelCount),
            ),
            const SizedBox(height: Styling.verticalGapLarge),
            Align(
                alignment: Alignment.center,
                child: Text(Constants.textBMILabel,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Align(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Result()),
                      );
                    },
                    child: new Text(textBMIValue,
                        style: TextStyle(
                            color: textBMIColor,
                            fontWeight: FontWeight.bold)))),
          ],
        )));
  }
}
