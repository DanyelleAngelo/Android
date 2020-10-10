import 'package:trabalho5/component/cria_textfield.dart';
import 'package:trabalho5/component/cria_dropdown.dart';
import 'package:trabalho5/controller/programa.dart';
import 'package:trabalho5/model/programa.dart';
import 'package:flutter/material.dart';
import 'lista_programa.dart';
import 'cadastro.dart';

class ExibePrograma extends StatefulWidget {
  final Programa programa;
  ExibePrograma({this.programa});
  @override
  _ExibeProgramaState createState() => _ExibeProgramaState();
}
class _ExibeProgramaState extends State<ExibePrograma> {
  ProgramaController _programaController = ProgramaController();
  String _id;
  Programa _ultimoRemovido;
  
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //método
  _displaySnackBar(BuildContext context, String mensagem) {
    final snackBar = SnackBar(
      content: Text(mensagem),
      backgroundColor: Colors.blue[600],
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  //método
  _voltar() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListaPrograma(),
        ),
      );
    });
  }
  
  //método
  mostrarAlerta(BuildContext context) {
    Widget botaoNao = FlatButton(
      child: Text(
        "Não",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget botaoSim = FlatButton(
      child: Text(
        "Sim",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        _ultimoRemovido = widget.programa;
        _programaController.excluir(_ultimoRemovido.id);
        _voltar();
      },
    );
    AlertDialog alerta = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Colors.lightBlue[300],
      title: Text(
        "Aviso",
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        "Deseja apagar o registro?",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        botaoNao,
        botaoSim,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  //método
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("${widget.programa.nome}"),
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
              child: Text(
                "Sobre:\n${widget.programa.sobre}\n\n"+
                "Duração:\n${widget.programa.duracao}\n\n"+
                "Studio:\n${widget.programa.studio}\n\n"+
                "Distribuidor:\n${widget.programa.distribuidor}\n\n"+
                "País de origem:\n${widget.programa.pais}\n\n"+
                "Idioma original:\n${widget.programa.idioma}\n\n"+
                "Avaliação:\n${widget.programa.avaliacao}\n\n"+
                "Ano de lançamento:\n${widget.programa.ano}\n\n",
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CadastroPrograma(
                          programa: widget.programa,
                        ),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  label: Text(
                    'Editar',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  textColor: Colors.white,
                  splashColor: Colors.lightBlue[300],
                  color: Colors.black,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton.icon(
                  onPressed: () {
                    setState(() {
                      mostrarAlerta(context);
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  label: Text(
                    'Excluir',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.delete,
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