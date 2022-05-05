class EmployyeesModel {
  EmployyeesModel({
      this.nome, 
      this.id, 
      this.ativo, 
      this.linkImg, 
      this.cargo, 
      this.dataCotntratado,});

  EmployyeesModel.fromJson(dynamic json) {
    nome = json['nome'];
    id = json['id'];
    ativo = json['ativo'];
    linkImg = json['linkImg'];
    cargo = json['cargo'];
    dataCotntratado = json['dataCotntratado'];
  }
  String? nome;
  String? id;
  bool? ativo;
  String? linkImg;
  String? cargo;
  String? dataCotntratado;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nome'] = nome;
    map['id'] = id;
    map['ativo'] = ativo;
    map['linkImg'] = linkImg;
    map['cargo'] = cargo;
    map['dataCotntratado'] = dataCotntratado;
    return map;
  }

}