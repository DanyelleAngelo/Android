import 'package:flutter/material.dart';
import 'package:trabalho3/view/emprestimo.dart';

import 'dart:io';
import 'package:flutter/foundation.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);
  };
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.yellow[600],
      accentColor: Colors.brown[900],
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.black,
        textTheme: ButtonTextTheme.primary,
      ),
    ),
    home: Home(),
  ));
}