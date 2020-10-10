import 'package:flutter/material.dart';

Widget criaDropdownButton(List<String> elementos, Function funcao,String itemSelecionado){
  return DropdownButton(
    style: TextStyle(color:Colors.lightGreen[900],fontSize:15.0),
    items: elementos.map((String dropDownStringItem){
      return DropdownMenuItem<String>(
        value: dropDownStringItem,
        child: null
      );;
    }).toList(),
    onChanged: funcao,
    value: itemSelecionado,
  );
} 