import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'styling.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appTitle),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          const SizedBox(height: Styling.verticalGapSmall),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(Constants.subtitleAbout,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          const SizedBox(height: Styling.verticalGapSmall),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(Constants.textAbout)),
          const SizedBox(height: Styling.verticalGapLarge),
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
