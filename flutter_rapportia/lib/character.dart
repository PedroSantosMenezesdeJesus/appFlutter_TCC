class Character
{
  late String nome;
  late String descricao;
  late String img;

  Character()
  {
    nome = "";
    descricao = "";
    img = "";
  }

  Character.dados(this.nome, this.descricao, this.img);

  Character.fromJson(Map<String, dynamic> json):
  nome = json["Personagem_Name"] as String,
  descricao = json["Personagem_Descricao"] as String,
  img = json["Personagem_Img"] as String;
  
}
