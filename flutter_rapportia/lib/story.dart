import 'package:flutter/material.dart';

void storypag() {
  runApp(const StoryPag());
}

class StoryPag extends StatelessWidget{
  const StoryPag({super.key});

  @override

  Widget build(BuildContext context) {

    final ScrollController controle = ScrollController();

    return Scaffold(

      //backgroundColor: Color.fromRGBO(241, 191, 39, 1),
        
        /*appBar: AppBar(
          centerTitle: true,
          //backgroundColor: const Color.fromRGBO(29, 60, 124, 1),
          
        ),*/

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

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    

                    Center(          
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(text: "A última", style: TextStyle(fontFamily: 'Sunshiney', fontSize: 72, color:Color.fromRGBO(0, 0, 0, 1))),             
                            TextSpan(text: "\nLuz", style: TextStyle(fontFamily: 'Sunshiney', fontSize: 72, color:Color.fromRGBO(241, 191, 39, 1)))
                          ]
                        )
                      ),
                    ),
                    
                    Wrap(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text("  Em um mundo onde a fúria dos deuses caiu sobre a humanidade por causa de sua maldade, apenas destruição era encontrada em todos os lugares. Mesmo com a extinção em massa, um grupo de sobreviventes estudiosos, que ainda acreditavam na humanidade, resolveram realizar uma última tentativa de salvação: uma guerreira forjada no corpo de uma jovem morta.", 
                          style: TextStyle(fontFamily: 'Sunshiney', fontSize: 28, color:Color.fromRGBO(0, 0, 0, 1)), textAlign: TextAlign.center,),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text("  Após anos e anos de espera, a guerreira, de nome Hélia, acordou no meio do caos e da ausência de vida de um lugar há muito tempo habitado. Ao ir em um templo abandonado, recebe uma clara missão dos deuses: derrotar os quatro guardiões (Fome, Guerra, Peste e Morte) para provar que a humanidade ainda merecia uma outra chance.",
                          style: TextStyle(fontFamily: 'Sunshiney', fontSize: 28, color:Color.fromRGBO(0, 0, 0, 1)), textAlign: TextAlign.center,),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text("  Com essa missão no coração e uma espada nas costas, a guerreira sai no encontro de seus inimigos sendo guiada por uma luz mística azul. Assim, Hélia observa aquela terra sem vida enquanto aos poucos a restaura, possibilitando uma nova vida aos que já foram.",
                          style: TextStyle(fontFamily: 'Sunshiney', fontSize: 28, color:Color.fromRGBO(0, 0, 0, 1)), textAlign: TextAlign.center,),
                        )           
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
    );
  }
}