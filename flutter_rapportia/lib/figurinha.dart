class Figurinha
{
  late String figura;

  Figurinha()
  {
    figura = "";
  }

  Figurinha.dados(this.figura);

  Figurinha.fromJson(Map<String, dynamic> json):
  figura = json["Figura"] as String;
}