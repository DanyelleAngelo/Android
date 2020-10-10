import 'package:flutter/material.dart';
import 'package:aula7_gastMensal/component/criaDropDown.dart';
import 'package:aula7_gastMensal/component/criaTextField.dart';
import 'package:aula7_gastMensal/model/gasto.dart';

class Cadastro extends StatefulWidget{
  @override 
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro>{
  var _tipoGasto = ["Fixo","Variável","Eventual","Emergencial"];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Gasto Mensal"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
    );
  }
}