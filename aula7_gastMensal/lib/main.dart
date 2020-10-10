import 'package:aula7_gastMensal/controller/gastoController.dart';
import 'package:aula7_gastMensal/model/gasto.dart';
import 'package:flutter/material.dart';
import 'package:aula7_gastMensal/view/cadastro_gasto_mensal.dart'; 

void main() {
  /*runApp(MaterialApp(
    home: Cadastro(),
    theme: ThemeData(
      primaryColor: Colors.green,
      hintColor: Colors.green[100],
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.lightGreen[900])),
        hintStyle: TextStyle(color: Colors.amber),
      ),
    ),
  ));*/

  WidgetsFlutterBinding.ensureInitialized();
  GastoController gastoController = GastoController();

  //gastoController.excluir(1).then((result) => print(result));

  //gastoController.findAll().then((result) => print(result));

  //GastoMensal gastoMensal = GastoMensal(null,2020,"janeiro","Conta de luz",90.9,"Fixo");
  //gastoController.salvar(gastoMensal).then((result) => print(result));

  //GastoMensal gastoMensal = GastoMensal(null,2020,"marco","Conta de água",70.90,"Fixo");
  //gastoController.salvar(gastoMensal).then((result)=>print(result));
}