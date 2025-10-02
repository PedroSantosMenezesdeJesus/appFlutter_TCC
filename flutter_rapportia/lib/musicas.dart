class Musicas 
{
  late String music;
  late String nome;
  late String img;
  late double duracao;

  Musicas()
  {
    music = "";
    nome = "";
    img = "";
    duracao = 0;
  }

  Musicas.dados(this.music, this.nome, this.img, this.duracao);

  Musicas.fromJson(Map<String, dynamic> json):
  music = json["Music"] as String,
  nome = json["Music_Name"] as String,
  img = json["Music_Img"] as String,
  duracao = json["Music_Duration"] as double;

}