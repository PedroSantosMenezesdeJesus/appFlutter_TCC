class Figurinha
{
  late String figura;
  late String nome;

  Figurinha()
  {
    figura = "";
    nome = "";
  }

  Figurinha.dados(this.figura, this.nome);

  Figurinha.fromJson(Map<String, dynamic> json):
  figura = json["Figura"] as String,
  nome = json["Nome"] as String;
}