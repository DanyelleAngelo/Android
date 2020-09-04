import 'package:flutter/material.dart';

/*
void main(){
  runApp(MaterialApp(
    home: Container(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("aula 2 - Primeiros passos"),
          ),
          Text("Aula 2 - Primeiros passos"),
          Text("Aula 2 - Primeiros passos"),
          Text("Aula 2 - Primeiros passos"),
        ],
      )
    )
  ));
 }
*/
/*
void main(){
  runApp(MaterialApp(
    home:Scaffold(
      appBar:AppBar(
        title: Text("Aula 2 - primeiros passos"),
        centerTitle: true,
        backgroundColor:Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(/*barra de rolagem*/
        child: Column(
          children: <Widget>[
            Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType:TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Campo 1",
                        labelStyle: TextStyle(color:Colors.deepPurpleAccent),
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,fontSize: 18),
                    )
                  ],
                ),
            ),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
          ],
        ),
      ),
    )
  ));
}*/

void main(){
  runApp(MaterialApp(
      home: Tela(),
  ));
}

class Tela extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text("Aula 2 - primeiros passos"),
        centerTitle: true,
        backgroundColor:Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(/*barra de rolagem*/
        child: Column(
          children: <Widget>[
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType:TextInputType.number,
                    decoration: InputDecoration(/*plechoeder*/
                      labelText: "Campo 1",
                      labelStyle: TextStyle(color:Colors.deepPurpleAccent),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black,fontSize: 18),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Isso é um texto",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.lightBlue,fontSize: 18.0),
                      ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                      child: RaisedButton(
                        onPressed: (){},
                        child: Text(
                          "Clique aqui",
                          style: TextStyle(color: Colors.white,fontSize: 18.0),
                        ),
                        color: Colors.deepOrange
                      ),
                  ),
                ],
              ),
            ),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
            Text("Aula 2 - Primeiros passos"),
          ],
        ),
      ),
    );

  }
}