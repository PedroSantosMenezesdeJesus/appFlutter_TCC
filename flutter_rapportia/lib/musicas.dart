class Musicas 
{
  late String music;
  late String nome;
  late String img;
  

  Musicas()
  {
    music = "";
    nome = "";
    img = "";
  }

  Musicas.dados(this.music, this.nome, this.img);

  Musicas.fromJson(Map<String, dynamic> json):
  music = json["Music"] as String,
  nome = json["Music_Name"] as String,
  img = json["Music_Img"] as String;

}