class Mapa
{
  late String nome;
  late String descricao;
  late String img;
  late String imgDescricao;

  Mapa()
  {
    nome = "";
    descricao = "";
    img = "";
    imgDescricao = "";
  }

  Mapa.dados(this.nome, this.descricao, this.img);

  Mapa.fromJson(Map<String, dynamic> json):
  nome = json["Mapa_nome"] as String,
  descricao = json["Mapa_descricao"] as String,
  img = json["Mapa_img"] as String,
  imgDescricao = json["Mapa_descricao_img"] as String;
}