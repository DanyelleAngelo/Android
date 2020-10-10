import 'package:trabalho4/component/programa_item.dart';
import 'package:trabalho4/controller/programa.dart';
import 'package:trabalho4/model/programa.dart';
import 'package:flutter/material.dart';

import 'cadastro.dart';

class ListaPrograma extends StatefulWidget {
  @override
  _ListaProgramaState createState() => _ListaProgramaState();
}
class _ListaProgramaState extends State<ListaPrograma> {
  List<Programa> _listaProgramas = [];
  ProgramaController _programaController = ProgramaController();
  @override
  void initState() {
    super.initState();
    _programaController.findAll().then((dados) {
      setState(() {
        _listaProgramas = dados;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Programas assistidos"),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Programa>>(
        initialData: _listaProgramas,
        future: _programaController.findAll(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando..."),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Programa> programas = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index){
                  final Programa programa = programas[index];
                  return ProgramaItem(programa,_listaProgramas,index);
                },
                itemCount: programas.length,
              );
              break;
          }
          return Text("Erro");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CadastroPrograma(),
              ),
            );
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
    );
  }
}