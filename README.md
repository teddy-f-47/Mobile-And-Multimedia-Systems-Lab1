# bmi_app

This repository contains the work for Lab1.

The application is developed with ***Flutter***.

## The built Android app

The APK file built for Android is available at:

build\app\outputs\flutter-apk\app-release.apk

The Appbundle file for Android is available at:

build\app\outputs\bundle\release\app-release.aab

## The code

All of the code for developing the app is available in the directory lib/.

- main.dart : This is the 'root' of the application with the code for the app's main page.

- constants.dart : This file contains string constants that are re-usable across the app.

- styling.dart : This file contains constants for custom styling, also re-usable across the app.

- storage.dart : This is the code that handles saving and retrieving data to/from SharedPreferences.

- bmi.dart : This is the code that contains the BMI calculation.

- viewmodel.dart : This is the code that bridges the UI (main.dart, result.dart, history.dart, about.dart) with the storage. When saving data, it retrieves data from the UI and eventually save the data to the storage via storage.dart. When loading data, it retrieves saved data from the storage via storage.dart, perform calculation by calling bmi.dart, and send the result to the requesting UI.

- result.dart : This is the code for the Result page, i.e. when the user clicks/taps on their result on the main page.

- history.dart : This is the code for the Calculation History page, which shows the 10 last BMI calculations.

- about.dart : This is the code for the About Author page, which shows information about the author of the app.

## The test

All tests are written using Flutter's flutter_test and integration_test packages.

The unit test for the app is written at:

test/bmi_test.dart

The integration test (UI test) for the app is written at:

integration_test/ui_test.dart


