class Musica
{
  late String music;
  late String nome;
  late String img;
  

  Musica()
  {
    music = "";
    nome = "";
    img = "";
  }

  Musica.dados(this.music, this.nome, this.img);

  Musica.fromJson(Map<String, dynamic> json):
  music = json["Music"] as String,
  nome = json["Music_Name"] as String,
  img = json["Music_Img"] as String;

}