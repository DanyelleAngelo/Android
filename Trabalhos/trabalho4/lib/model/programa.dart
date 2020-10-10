class Programa {
  String id;
  String nome;
  String sobre;
  String duracao;
  String studio;
  String distribuidor;
  String pais;
  String idioma;
  String avaliacao;
  int ano;

  Programa(this.nome,this.sobre,this.duracao,this.studio,this.distribuidor,this.pais,this.idioma,this.avaliacao,this.ano,{this.id});

  Map<String, dynamic> toMap() => {
        "nome": nome,
        "sobre": sobre,
        "duracao": duracao,
        "studio": studio,
        "distribuidor": distribuidor,
        "pais":  pais,
        "idioma": idioma,
        "avaliacao": avaliacao,
        "ano": ano,
      };

  Programa.fromJson(Map<String, dynamic> json, String id_firebase)
      : nome = json["nome"],
        sobre = json["sobre"],
        duracao = json["duracao"],
        studio = json["studio"],
        distribuidor = json["distribuidor"],
        pais = json["pais"],
        idioma = json["idioma"],
        avaliacao = json["avaliacao"],
        ano = json["ano"],
        id = id_firebase;

  @override
  String toString() {
    return "Título: $nome \n Sobre: $sobre \n Duração: $duracao \n Studio: $studio \n Distribuidor: $distribuidor \n País de origem: $pais \n Idioma: $idioma \n Ano de lançament: $ano \n Avaliação: $avaliacao";
  }
}