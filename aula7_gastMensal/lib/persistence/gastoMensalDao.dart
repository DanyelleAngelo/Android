import 'dart:io';
import 'package:aula7_gastMensal/model/gasto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GastoMensalDao{
  static final _databaseName = "gasto.db";
  static final _databaseVersion = 1;
  static final table = "gastomensal";
  static final _id = "_id";
  static final _ano  = "ano";
  static final _mes  = "mes";
  static final _finalidade  = "finalidade";
  static final _valor  = "valor";
  static final _tipoGasto  = "tipoGasto";

  //a classe agora é singleton: tem somente uma instancia no projeto, a mesma é de acesso global
  GastoMensalDao._privateConstructor();
  static final GastoMensalDao instance = GastoMensalDao._privateConstructor(); 
  static Database _database;

  Future<Database> get database async{
    if(_database != null) return _database;
    //instancia o db na primeira vez que for acessado
    _database = await _initDatabase();
    return _database;
  }

  //abre ou cria o db
  _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
      version: _databaseVersion, 
      onCreate: _onCreate);
  }

  //criação do banco de dados e da tabela
  Future _onCreate(Database db, int version) async{
    await db.execute("""
          CREATE TABLE $table (
            $_id INTEGER PRIMARY KEY,
            $_ano INTEGER NOT NULL,
            $_mes TEXT NOT NULL,
            $_finalidade TEXT NOT NULL,
            $_valor REAL NOT NULL,
            $_tipoGasto TEXT NOT NULL
          )
          """);
  }

  //CRUD AQUI
  static Future<int> inserir(GastoMensal gastoMensal) async{
    var result =0;
    try{
      Database db = await instance.database;
      result = await db.insert(table, gastoMensal.getGastoMensal());
    }on Exception catch(e){
      return 0;
    }
    return result;
  }
  
  static Future<List<GastoMensal>> findAll() async {
    var result;
    List<GastoMensal> gastos;
    try {
      final Database db = await instance.database;
      result = await db.query(table);
      gastos = _toList(result);
    } on Exception catch (e) {
      return null;
    }
    return gastos;
  }

  static List<GastoMensal> _toList(List<Map<String, dynamic>> result) {
    final List<GastoMensal> gastos = List();
    for (Map<String, dynamic> row in result) {
      final GastoMensal gastoMensal = GastoMensal(row[_id],row[_ano],row[_mes],row[_finalidade],row[_valor],row[_tipoGasto] );
      gastos.add(gastoMensal);
    }
    return gastos;
  }

  static Future<int> alterar(GastoMensal gastoMensal) async {
    var result = 0;
    try {
      Database db = await instance.database;
      result = await db.update(
        table,
        gastoMensal.getGastoMensal(),
        where: "$_id = ?",
        whereArgs: [gastoMensal.id],
      );
    } on Exception catch (e) {
      return 0;
    }
    return result;
  }

  static Future<int> excluir(int id) async {
    var result = 0;
    try {
      Database db = await instance.database;
      result = await db.delete(table, where: "$_id = ?", whereArgs: [id]);
    } on Exception catch (e) {
      return 0;
    }
    return result;
  }


}