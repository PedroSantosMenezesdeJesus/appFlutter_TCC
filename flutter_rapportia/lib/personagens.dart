import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_rapportia/character.dart';
import 'package:flutter_rapportia/descricao.dart';

void personagempag() {
   runApp( 
    const MaterialApp(
      title: "Personagema", 
      home: PersonagemPag(),
    )
  );
}

class PersonagemPag extends StatefulWidget{
  const PersonagemPag({super.key});

  @override 
  PersonagemPAG createState() => PersonagemPAG();
}

class PersonagemPAG extends State{

   // cria uma lista vazia chamada de personagem, usando a classe Character (classe dos personagens)
  List<Character> personagem = List.empty(growable: true);

   // função readJson que pega as informações do personagens.json, é decodificada e depois inserida na lista personagem.
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/personagens.json');
      Iterable data = await json.decode(response);
    personagem = List<Character>.from(data.map((model) => Character.fromJson(model)));

    setState(() {
      personagem;
    });
  }

  @override
  void initState() {
    super.initState();
      readJson();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controle = ScrollController();

    return Scaffold(

      //backgroundColor: Color.fromRGBO(241, 191, 39, 1),
        
        /*appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(29, 60, 124, 1),
          
        ), */

      body: Center(    
         //cria um scrollbar para o container que basicamente contem todas as informações da tela personagens
          child: Scrollbar(

            trackVisibility: true,
            thumbVisibility: true,
            thickness: 10,
            radius: const Radius.circular(20),
            interactive: true,
            controller: controle,

             // cria um listView.builder essencial para que o scrollbar possa funcionar
            child: ListView.builder(

              controller: controle,
              itemCount: 1,
              itemBuilder: (context, index) {

                return Container(

                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,


                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(16, 25, 50, 1),
                    borderRadius: BorderRadius.circular(16)
                  ),    

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max, 

                    children: [

                      Text('Personagens', style: TextStyle(fontFamily: 'Sunshiney', fontSize: 72, color:Color.fromRGBO(0, 0, 0, 1))),

                      Expanded(

                         // cria um listView.builder que criara uma lista com o quantidade igual a de itens na lista de personagem. 
                         // que mostrara os nome e imagens dos personagens decorrentes ao seus indexs
                        child: ListView.builder(

                          itemCount: personagem.length,
                          padding: const EdgeInsets.all(5),

                          itemBuilder: (BuildContext ctx, index) 
                          {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,

                              children: [
                                Padding(padding: EdgeInsets.all(16)),

                                Text(personagem[index].nome, style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontFamily: 'Sunshiney', fontSize: 36),),

                                 // detecta toque para ativar um navigator que leva a tela de descrição
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DescricaoPag(),
                                      settings: RouteSettings(
                                        arguments: personagem[index]
                                      )
                                    )
                                  ),
                                  child: Image.asset(personagem[index].img, width: 400, height: 300, fit: BoxFit.cover),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
    );
  }
}
