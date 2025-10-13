class Mapa
{
  late String nome;
  late String descricao;
  late String img;

  Mapa()
  {
    nome = "";
    descricao = "";
    img = "";
  }

  Mapa.dados(this.nome, this.descricao, this.img);

  Mapa.fromJson(Map<String, dynamic> json):
  nome = json["Mapa_nome"] as String,
  descricao = json["Mapa_descricao"] as String,
  img = json["Mapa_img"] as String;
}