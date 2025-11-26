class Figurinha
{
  late String figura;
  late String nome;
  late String link;

  Figurinha()
  {
    figura = "";
    nome = "";
    link = "";
  }

  Figurinha.dados(this.figura, this.nome, this.link);

  Figurinha.fromJson(Map<String, dynamic> json):
  figura = json["Figura"] as String,
  nome = json["Figura_nome"] as String,
  link = json["Figura_link"] as String;
}