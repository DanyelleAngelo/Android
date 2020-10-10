import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trabalho4/model/programa.dart';

class ProgramaDao {
  final databaseReference = FirebaseFirestore.instance;
  final String COLECAO = "programa";

  Future<String> inserir(Programa programa) async {
    try {
      DocumentReference ref =
          await databaseReference.collection(COLECAO).add(programa.toMap());
      return ref.id;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> alterar(Programa programa) async{
    try {
      await databaseReference.collection(COLECAO).doc(programa.id).update(programa.toMap());
      return "Registro atualizado";
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<Programa>> findAll() async {
    QuerySnapshot programas = await databaseReference.collection(COLECAO).get();
    List<Programa> listaProgramas = List();
    programas.docs.forEach((elemento) {
      listaProgramas.add(Programa.fromJson(elemento.data(), elemento.id));
    });
    return listaProgramas;
  }

  Future<String> excluir(String id) async{
    try {
      await databaseReference
          .collection(COLECAO)
          .doc(id)
          .delete();
      return "Registro excluído com projeto";
    } catch (e) {
      return e.toString();
    }
  }
}