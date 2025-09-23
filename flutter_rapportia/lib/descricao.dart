import 'package:flutter/material.dart';
import 'package:flutter_rapportia/character.dart';

void descricaopag() {
  runApp(const DescricaoPag());
}

class DescricaoPag extends StatelessWidget{
  const DescricaoPag({super.key});

  @override
  Widget build(BuildContext context) {

    final personagem = ModalRoute.of(context)!.settings.arguments as Character;

    final ScrollController controle = ScrollController();

    return Scaffold(

      //backgroundColor: Color.fromRGBO(241, 191, 39, 1),
        
        appBar: AppBar(
          centerTitle: true,
          //backgroundColor: const Color.fromRGBO(29, 60, 124, 1),
          
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
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,

                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(16, 25, 50, 1),
                    borderRadius: BorderRadius.circular(16)
                  ),    

                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Text(personagem.nome, style: TextStyle(fontSize: 20, color:Color.fromRGBO(0, 0, 0, 1)), textAlign: TextAlign.center,),
                      Padding(padding: EdgeInsets.all(8)),
                      Image.asset(personagem.img, width: 300, height: 200,),
                      Padding(padding: EdgeInsets.all(8)),
                      Text(personagem.descricao, style: TextStyle(fontSize: 16, color:Color.fromRGBO(0, 0, 0, 1)),),
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