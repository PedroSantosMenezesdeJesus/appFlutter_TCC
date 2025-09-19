import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_rapportia/character.dart';

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

  List<Character> personagem = List.empty(growable: true);

  Future<void> readJsonPersonagem() async {
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
      readJsonPersonagem();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controle = ScrollController();

    return Scaffold(

      backgroundColor: Color.fromRGBO(241, 191, 39, 1),
        
        appBar: AppBar(
          title: const Text('PERSONAGENS', style: TextStyle(fontSize: 20, color:Color.fromARGB(255, 255, 255, 255))),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(29, 60, 124, 1),
          
        ),

      body: Center(    

          child: Scrollbar(

            trackVisibility: true,
            thumbVisibility: true,
            thickness: 10,
            radius: const Radius.circular(20),
            interactive: true,
            controller: controle,
            
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
                    color: Color.fromRGBO(16, 25, 50, 1),
                    borderRadius: BorderRadius.circular(16)
                  ),    

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Expanded(
                        child: Text('Personagens', style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 255, 255, 255)))
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