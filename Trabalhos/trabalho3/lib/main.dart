import 'package:flutter/material.dart';
import 'package:trabalho3/view/emprestimo.dart';

void main() {
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