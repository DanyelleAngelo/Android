class Pessoa{
  String _nome;
  Pessoa(this._nome);
  String get nome => _nome;
}

class Objeto{
  String _tipo;
  String _descricao;
  Objeto(this._tipo,this._descricao);
  String get tipo => _tipo;
  String get descricao => _descricao;
}

class Emprestimo{
  bool _status;
  DateTime _dataInfo;
  Pessoa _cliente;
  Objeto _objeto;

  Emprestimo(this._status,this._dataInfo,this._cliente,this._objeto);
  Map getEmprestimo(){
    Map<String, dynamic> emprestimo = Map();
    emprestimo["status"] = _status;
    emprestimo["dataInfo"] = _dataInfo;
    emprestimo["nome"] = _cliente.nome;
    emprestimo["tipo"] = _objeto.tipo;
    emprestimo["descricao"] = _objeto.descricao;
  }
}