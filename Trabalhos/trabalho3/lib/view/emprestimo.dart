import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabalho3/model/emprestimo.dart';
import 'package:trabalho3/persistence/manipula_arquivo.dart';

class Home extends StatefulWidget{
  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  GlobalKey <FormState> _validator = GlobalKey<FormState>();
  ManipulaArquivo manipulaArquivo = ManipulaArquivo();

  final _nomePessoaController = TextEditingController();
  final _tipoObjetoController = TextEditingController();
  final _descricaoObjetoController = TextEditingController();
  DateTime _dataInfo = DateTime.now();
  
  Map<String, dynamic> _ultimoRemovido;
  int _ultimoRemovidoPos;
  List _emprestimoList = [];
  final dataFormatada = new DateFormat('dd-MM-yyyy');

  @override
  void initState(){
    super.initState();
    manipulaArquivo.readEmprestimo().then((dado){
      setState(() {
        _emprestimoList = json.decode(dado);
      });
    });
  }

  _limparFormulario(){
    _validator = GlobalKey<FormState>();
    _nomePessoaController.text = "";
    _tipoObjetoController.text = "";
    _descricaoObjetoController.text = "";
    _dataInfo  = DateTime.now();
  }
  
  _salvarEmprestimo(){
    setState(() {
      Map<String, dynamic> newEmprestimo = Map();
      final String _data = dataFormatada.format(_dataInfo);
      //Pessoa cliente = Pessoa(_nomePessoaController.text);
      //Objeto item = Objeto(_tip_tipoObjetoControlleroObjetoController.text,_descricaoObjetoController.text);
      Emprestimo emprestimo = Emprestimo(false,_data,_nomePessoaController.text,_tipoObjetoController.text,_descricaoObjetoController.text);
      newEmprestimo = emprestimo.getEmprestimo();
      _limparFormulario();
      _emprestimoList.add(newEmprestimo);
      manipulaArquivo.saveEmprestimo(_emprestimoList);
    });
  }

  Future<Null> _refresh() async{
    await Future.delayed(Duration(seconds: 1));
    setState((){
      _emprestimoList.sort((a,b){
        if(a["status"]  && !b["status"]) return 1;
        else if(!a["status"]  && b["status"]) return -1;
        else return 0;
      });
      manipulaArquivo.saveEmprestimo(_emprestimoList);
    });
    return null;
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffe and Books"),
        centerTitle: true
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _validator,
          child: Column(
             children: <Widget>[
              Text(
                "Empréstimos de livros",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.brown[900]),
              ),
              TextFormField(
                controller: _nomePessoaController,
                decoration: InputDecoration(
                  labelText: "Nome do cliente"
                ),
                validator: (value){
                  return value == "" ?"Campo obrigatório!" :null;
                },
              ),
              TextFormField(
                controller: _tipoObjetoController,
                decoration: InputDecoration(
                  labelText: "Tipo"
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Campo Obrigatório!";
                  }
                },
              ),
              TextFormField(
                controller: _descricaoObjetoController,
                decoration: InputDecoration(
                  labelText: "Descrição"
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Campo Obrigatório!";
                  }
                }
              ),
              RaisedButton(
                child: Row(
                  children: <Widget>[
                    Text("${_dataInfo.toLocal()}".split(' ')[0]),
                    Icon(Icons.calendar_today),
                  ],
                ),
                onPressed: () async{
                  final dataSelecionada = await showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(2020), 
                    lastDate: DateTime(2050),
                  );
                  builder: (BuildContext context, Widget child){
                      return Theme(
                        data: ThemeData.dark(),
                        child: child,
                      );
                  };
                  if(dataSelecionada != null && dataSelecionada != _dataInfo){
                    setState(() {
                      _dataInfo = dataSelecionada as DateTime; 
                    });
                  }
                },
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end ,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: RaisedButton(
                        child: Text("Limpar"),
                        onPressed: (){
                          _limparFormulario();
                        }
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.all(20.0),
                      child: RaisedButton(
                        child: Text("Concluir"),
                        onPressed: (){
                          if(_validator.currentState.validate()){
                            print(_validator);
                            _salvarEmprestimo();
                          }
                        },
                      ),
                    ),
                  ],
              ),
              Text(
                  "\nLivros emprestados",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.brown[900]),
              ),
             Expanded(
                child: RefreshIndicator(onRefresh: _refresh,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top:15.0),
                    itemCount: _emprestimoList.length,
                    itemBuilder: buildItem),),
              ),
            ] 
          ),
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, int index){
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.black,
        child: Align(
          alignment: Alignment(-0.9,0.0),
          child: Icon(Icons.delete,color: Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
          title: Text(
            "Cliente ${_emprestimoList[index]["nome"]}\n"+
            "Tipo: ${_emprestimoList[index]["tipo"]}\n"+
            "Descrição: ${_emprestimoList[index]["descricao"]}\n"+
            "Data de empréstimo: ${_emprestimoList[index]["dataInfo"]}\n"
            ),
          value: _emprestimoList[index]["status"],
          secondary: CircleAvatar(
            child: Icon(_emprestimoList[index]["status"]?
              Icons.check: Icons.error,)
          ),
          onChanged: (c){
            setState(() {
              _emprestimoList[index]["status"] = c;
              manipulaArquivo.saveEmprestimo(_emprestimoList);
            });
          },
      ),
      onDismissed: (direction){
        setState(() {
          _ultimoRemovido = Map.from(_emprestimoList[index]);
          _ultimoRemovidoPos = index;
          _emprestimoList.removeAt(index);

          manipulaArquivo.saveEmprestimo(_emprestimoList);
          final snack = SnackBar(
            content: Text("O empréstimo de ${_ultimoRemovido["nome"]} (${_ultimoRemovido["descricao"]}) foi excluído com sucesso!"),
            action: SnackBarAction(
              label: 'Desfazer ação',
              onPressed: (){
                setState((){
                  _emprestimoList.insert(_ultimoRemovidoPos,_ultimoRemovido);
                  manipulaArquivo.saveEmprestimo(_emprestimoList);
                });
              }),
            duration: Duration(seconds:4),
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }
}