class Musicas 
{
  late String nome;

  Musicas()
  {
    nome = "";
  }

  Musicas.dados(this.nome);

  Musicas.fromJson(Map<String, dynamic> json):
  nome = json["Music_Name"] as String;
}