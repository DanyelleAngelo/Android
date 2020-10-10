import 'package:aula7_gastMensal/model/gasto.dart';
import 'package:aula7_gastMensal/persistence/gastoMensalDao.dart';

class GastoController{
  Future<String> salvar(GastoMensal gastoMensal) async {
    int result = 0;
    if (gastoMensal.id == null) {
      result = await GastoMensalDao.inserir(gastoMensal);
    } else {
      result = await GastoMensalDao.alterar(gastoMensal);
    }
    if (result == 0) {
      return "Erro ao salvar registro";
    } else {
      return "Salvo com sucesso.";
    }
  }

  Future<List<GastoMensal>> findAll() async{
    List<GastoMensal> gastos = await GastoMensalDao.findAll();
    return gastos;
  }

  Future<String> excluir(int id) async{
    int result =  0;
    result = await GastoMensalDao.excluir(id);
    if(result ==0){
      return "Erro ao excluir o registro";
    }else{
      return "Excluído com sucesso.";
    }
  }
}