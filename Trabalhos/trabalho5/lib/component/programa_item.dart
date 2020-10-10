import 'package:trabalho5/view/cadastro.dart';
import 'package:trabalho5/view/exibe_programa.dart';
import 'package:trabalho5/view/lista_programa.dart';
import 'package:flutter/material.dart';
import 'package:trabalho5/controller/programa.dart';
import 'package:trabalho5/model/programa.dart';


class ProgramaItem extends StatefulWidget {
  Programa _programa;
  List<Programa> _listaProgramas;
  int _index;
  ProgramaItem(this._programa, this._listaProgramas, this._index);
  @override
  _ProgramaItemState createState() => _ProgramaItemState();
}

class _ProgramaItemState extends State<ProgramaItem> {
  Programa _ultimoRemovido;
  ProgramaController _programaController = ProgramaController();
  _atualizarLista() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListaPrograma(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.lightBlue[300],
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: Card(
        color: Colors.indigo[900],
        child: ListTile(
          title: Text(
            widget._programa.nome,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
       
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExibePrograma(
                  programa: widget._listaProgramas[widget._index],
                ),
              ),
            );
          },
        ),
      ),
      onDismissed: (direction) {
        setState(() {
          mostrarAlerta(context);
        });
      },
    );
  }
  mostrarAlerta(BuildContext context) {
    Widget botaoNao = FlatButton(
      child: Text(
        "Não",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        _atualizarLista();
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
        _ultimoRemovido = widget._listaProgramas[widget._index];
        widget._listaProgramas.removeAt(widget._index);
        _programaController.excluir(_ultimoRemovido.id);
        _atualizarLista();
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
}