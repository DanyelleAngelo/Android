 //Instituto Federal de Brasília
 //Aluna: Danyelle da Silva Oliveira Angelo
 //Disciplina: Optativa 2 - 2020 (Android)    - Professor: José Gonçalo

 abstract class Cliente{
  int _codigo;
  String _nome;
  String _endereco;
  String _uf;
  String _cep;
  var isNumber = RegExp(r'^[0-9]+$');
  
  
  Cliente(int codigo,String nome,String endereco,String uf,String cep){
    inserir(codigo,nome,endereco,uf,cep);
  }
  
  
  void inserir(int codigo,String nome,String endereco,String uf,String cep){
    this._codigo = codigo;
    if(nome.length >0)this._nome = nome;
    if(endereco.length >0)this._endereco = endereco;
    if(uf.length >0)this._uf = uf;
    if(cep.length >0)this._cep = cep;
  }
  
  void alterar({int codigo=-1,String nome="",String endereco="",String uf="",String cep=""}){
    print("Alterando os dados ........");
    if(codigo  > -1)this._codigo = codigo;
    if(nome.length >0)this._nome = nome;
    if(endereco.length >0)this._endereco = endereco;
    if(uf.length >0)this._uf = uf;
    if(cep.length >0)this._cep = cep;
  }
  
  int get codigo => _codigo;
  String get nome => _nome;
  String get endereco => _endereco;
  String get uf => _uf;
  String get cep => _cep;
}

class PessoaFisica extends Cliente{
  String _cpf;
  String _rg;
  String _sexo;
  String _dataNascimento;
  
    PessoaFisica(int codigo,String nome,String endereco,String uf,String cep,String cpf,String rg,String sexo,String dataNascimento):super(codigo,nome,endereco,uf,cep){
      this._cpf = validarCpf(cpf);
      this._rg = rg;
      this._sexo = sexo;
      this._dataNascimento = dataNascimento;
    }
  
  String validarCpf(String cpf){
    if(cpf.length == 11 && isNumber.hasMatch(cpf)){
      return cpf;
    }
    return "Lanca excecao";
  }
  
  @override
  String toString(){
    return "Dados - Pessoa Fisica \nCodigo: $codigo \nNome: $nome\nEndereço: $endereco - Estado: $uf - CEP: $cep\nCPF: $cpf - RG: $rg\nSexo: $sexo\nData Nascimento: $dataNascimento\n\n";
  }
  
  
  String get cpf => _cpf;
  String get rg => _rg;
  String get sexo => _sexo;
  String get dataNascimento => _dataNascimento;
}

class PessoaJuridica extends Cliente{
  String _cnpj;
  String _inscricaoEstadual;
  String _razaoSocial;
  
    PessoaJuridica(int codigo,String nome,String endereco,String uf,String cep,String cnpj,String inscricaoEstadual,String razaoSocial) : super(codigo,nome,endereco,uf,cep){
      this._cnpj = validarCnpj(cnpj);
      this._inscricaoEstadual = inscricaoEstadual;
      this._razaoSocial = razaoSocial;
    }
  
  String validarCnpj(String cnpj){
    if(cnpj.length == 14 && isNumber.hasMatch(cnpj)){
      return cnpj;
    }
    return "Lanca excecao";
  }
  
  void operation4(){
    var now = new DateTime.now();
    print(now);
  }
  
  @override
  String toString(){
    return "Dados - Pessoa Juridica \nCodigo: $codigo \nNome: $nome\nEndereço: $endereco - Estado: $uf - CEP: $cep\nCNPJ: $cnpj\nInscriçao Estadual: $inscricaoEstadual\nRazão Social: $razaoSocial \n\n";
  }
  
  String get cnpj => _cnpj;
  String get inscricaoEstadual => _inscricaoEstadual;
  String get razaoSocial => _razaoSocial;
}

void main(){
  PessoaFisica p1 = PessoaFisica(1,"Ana Vilella","Rua dos bobos, número 0","UF diferente","123456","00000000000","11111111","F","12/09/1900");
  
  PessoaJuridica p2 = PessoaJuridica(2,"Vilella Ana","Rua dos bobos, numero 0","UF diferente","123456","18781203000128","01010101","Minha Loja");
  
  print(p1);
  p1.alterar(codigo:3,nome:"Brenda");
  print(p1);
  print(p2);
}