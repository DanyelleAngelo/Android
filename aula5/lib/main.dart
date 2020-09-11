import 'package:flutter/material.dart';
import 'package:aula5/view/lista_atividade.dart';
void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.yellow[600],
      accentColor: Colors.yellow[800],
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.black,
        textTheme: ButtonTextTheme.primary
      ),
    ),
    home: Home(),
  ));
}