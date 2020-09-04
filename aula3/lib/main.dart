import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home:Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _informacao = "Digite os valores";
  TextEditingController taxaController = TextEditingController();
  TextEditingController valorBrutoController = TextEditingController();

  _limparFormulario(){
    _formKey = GlobalKey<FormState>();
    taxaController.text="";
    valorBrutoController.text="";
    setState(() {
      _informacao = "Digite os valores";
    });
  }

  _calcular(){
    setState(() {
      double taxa = double.parse(taxaController.text);
      double valorBruto = double.parse(valorBrutoController.text);
      double desconto = valorBruto * (taxa/100.0);
      double valorLiquido = valorBruto - desconto;
      _informacao = "Valor Bruto: ${valorBruto.toStringAsFixed(2)} \n"+
      "Desconto: ${desconto.toStringAsFixed(2)} \n"+
      "Valor líquido: ${valorLiquido.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagamento Autônomo"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _limparFormulario,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Taxa",
                  labelStyle: TextStyle(color: Colors.black),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize:18),
                controller: taxaController,
                validator: (value){
                  if(value.isEmpty){
                    return "A taxa não pode ser nula";
                  }
                  try{
                    double.parse(value);
                  }catch(e){
                    return "Valor inválido";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Valor bruto",
                  labelStyle: TextStyle(color: Colors.black),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize:18),
                controller: valorBrutoController,
                validator: (value){
                  if(value.isEmpty){
                    return "O valor bruto não pode ser nulo";
                  }
                  try{
                    double.parse(value);
                  }catch(e){
                    return "Valor inválido";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top:10.0,bottom:10.0),
                child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        _calcular();
                      }
                    },
                    child: Text(
                      "Calcular",
                       style: TextStyle(color: Colors.white,fontSize: 18.0),
                    ),
                    color: Colors.lightGreen,
                )
              ),
              Text(
                _informacao,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightGreen, fontSize: 18.0),
              ),
            ],
          )

        ),
      ),
    );
  }
}
