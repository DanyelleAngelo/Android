import 'package:trabalho4/component/cria_textfield.dart';
import 'package:trabalho4/component/cria_dropdown.dart';
import 'package:trabalho4/controller/programa.dart';
import 'package:trabalho4/model/programa.dart';
import 'package:flutter/material.dart';

import 'lista_programa.dart';

class CadastroPrograma extends StatefulWidget {
  final Programa programa;
  CadastroPrograma({this.programa});
  @override
  _CadastroProgramaState createState() => _CadastroProgramaState();
}
class _CadastroProgramaState extends State<CadastroPrograma> {
  ProgramaController _programaController = ProgramaController();
  String _id;
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _sobreController = TextEditingController();
  TextEditingController _duracaoController = TextEditingController();
  TextEditingController _studioController = TextEditingController();
  TextEditingController _distribuidorController = TextEditingController();
  TextEditingController _paisController = TextEditingController();
  TextEditingController _idiomaController = TextEditingController();
  TextEditingController _avaliacaoController = TextEditingController();
  TextEditingController _anoController = TextEditingController();
  var _avaliacao = ["", "Péssimo", "Ruim","Médiano","Bom","Ótimo"];
  var _avaliacaoSelecionada = "";

  final _scaffoldKey = GlobalKey<ScaffoldState>();
 
  _alterarAvaliacao(String novaAvaliacaoSelecionada) {
    _dropDownAvaliacaoSelected(novaAvaliacaoSelecionada);
      setState(() {
        this._avaliacaoSelecionada = novaAvaliacaoSelecionada;
        _avaliacaoController.text = this._avaliacaoSelecionada;
      });
    }
  _dropDownAvaliacaoSelected(String novaAvaliacao) {
    setState(() {
      this._avaliacaoSelecionada = novaAvaliacao;
    });
  }

  _displaySnackBar(BuildContext context, String mensagem) {
    final snackBar = SnackBar(
      content: Text(mensagem),
      backgroundColor: Colors.blue[600],
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  _salvar(BuildContext context) {
    Programa programa = Programa(_nomeController.text,_sobreController.text,_duracaoController.text,_studioController.text,_distribuidorController.text,
        _paisController.text,_idiomaController.text,_avaliacaoSelecionada, int.parse(_anoController.text),id: _id);
    setState(() {
      _programaController.salvar(programa).then((res) {
        setState(() {
          _displaySnackBar(context, "Salvo com sucesso!");
        });
      });
    });
  }
  @override
  void initState() {
    if(widget.programa != null){
      _id = widget.programa.id;
      _nomeController.text = widget.programa.nome;
      _sobreController.text = widget.programa.sobre; 
      _duracaoController.text = widget.programa.duracao;
      _studioController.text = widget.programa.studio;
      _distribuidorController.text = widget.programa.distribuidor;
      _paisController.text = widget.programa.pais;
      _idiomaController.text = widget.programa.idioma;
      _avaliacaoSelecionada = widget.programa.avaliacao; 
      _anoController.text = widget.programa.ano.toString();
    }else{
      _id = null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Inserir programa"),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaPrograma()),
              );
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: criaTextField("Nome", _nomeController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: criaTextField("Sobre", _sobreController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: criaTextField("Duração", _duracaoController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: criaTextField("Studio", _studioController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: criaTextField("Distribuidor", _distribuidorController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: criaTextField("Páis de origem", _paisController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: criaTextField("Idioma", _idiomaController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: criaTextField("Ano de lançamento", _anoController,TextInputType.number),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Avaliação:",
                    style: TextStyle(color: Colors.indigo[900]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: criaDropDownButton(_avaliacao, _alterarAvaliacao,
                        _avaliacaoSelecionada),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton.icon(
                  onPressed: () {
                    _salvar(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  label: Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  textColor: Colors.white,
                  splashColor: Colors.lightBlue[300],
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}