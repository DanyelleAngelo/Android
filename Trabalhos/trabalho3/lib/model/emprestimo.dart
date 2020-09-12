/*class Pessoa{
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
}*/

class Emprestimo{
  bool _status;
  String _dataInfo;
  String _nome;
  String _tipo;
  String _descricao;

  Emprestimo(this._status,this._dataInfo,this._nome,this._tipo,this._descricao);
  
  bool get status => status;
  String get dataInfo => _dataInfo;
  String get nome => _nome;
  String get tipo => _tipo;
  String get descricao => _descricao;

  Map getEmprestimo(){
    Map<String, dynamic> emprestimo = Map();
    emprestimo["status"] = _status;
    emprestimo["dataInfo"] = _dataInfo;
    emprestimo["nome"] = _nome;
    emprestimo["tipo"] = _tipo;
    emprestimo["descricao"] = _descricao;
    return emprestimo;
    /* 
    emprestimo["nome"] = _cliente.nome;
    emprestimo["tipo"] = _objeto.tipo;
    emprestimo["descricao"] = _objeto.descricao; */
  }
}