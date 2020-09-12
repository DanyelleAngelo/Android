import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  GlobalKey <FormState> _validator = GlobalKey<FormState>();

  final _nomePessoaController = TextEditingController();
  final _tipoObjetoController = TextEditingController();
  final _descricaoObjetoController = TextEditingController();
  DateTime _dataInfo = DateTime.now();
  
  _limparFormulario(){
    _validator = GlobalKey<FormState>();
    _nomePessoaController.text = "";
    _tipoObjetoController.text = "";
    _descricaoObjetoController.text = "";
    _dataInfo  = DateTime.now();
    setState(() {

    });
  }
  
  _salvarEmprestimo(){
    setState(() {
    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffe and Books - Empréstimos de livros"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _validator,
          child: Column(
             children: <Widget>[
              TextFormField(
                controller: _nomePessoaController,
                decoration: InputDecoration(
                  labelText: "Nome do cliente"
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Campo Obrigatório!";
                  }
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
                },
              ),
              RaisedButton(
                child: Row(
                  children: <Widget>[
                    Text("${_dataInfo}"),
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
                            _salvarEmprestimo();
                          }
                        },
                      ),
                    )
                  ],
              ),
            ] 
          ),
        ),
          
      ),
    );
  }
}