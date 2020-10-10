import 'package:trabalho5/dao/programa.dart';
import 'package:trabalho5/model/programa.dart';

class ProgramaController{
  ProgramaDao programaDao = ProgramaDao();
  Future<String> salvar(Programa programa){
    if(programa.id == null){
      return programaDao.inserir(programa);
    }else{
      return programaDao.alterar(programa);
    }
  }

  Future<List<Programa>> findAll() async{
    return programaDao.findAll();
  }

  Future<String> excluir(String id){
    return programaDao.excluir(id);
  }
}