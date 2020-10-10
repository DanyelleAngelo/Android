import 'package:trabalho4/view/lista_programa.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProgramaApp());
}
class ProgramaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.indigo[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ListaPrograma(),
    );
  }
}