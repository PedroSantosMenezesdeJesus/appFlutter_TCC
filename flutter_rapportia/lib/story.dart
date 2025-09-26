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
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,

                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(16, 25, 50, 1),
                    borderRadius: BorderRadius.circular(16)
                  ),    

                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Text("Há muito tempo, os deuses criaram o mundo e a vida para habitá-lo: humanos, animais e espíritos da natureza. Deram poder e conhecimento aos homens: magias, metalurgia sagrada, e o acesso a um fragmento da própria essência divina, deixado como fonte de poder e equilíbrio em um templo sagrado.", 
                          style: TextStyle(fontFamily: 'Sunshiney', fontSize: 24, color:Color.fromRGBO(0, 0, 0, 1),), textAlign: TextAlign.center,),
                          
                          Text("\n Com o tempo, a ganância e o orgulho corromperam a humanidade. Divididos, os povos roubaram e separaram os fragmentos da essência, iniciando uma era de guerras e destruição, movidos pelo desejo de controlar os dons divinos.",
                          style: TextStyle(fontFamily: 'Sunshiney', fontSize: 24, color:Color.fromRGBO(0, 0, 0, 1))),

                          
                        ],
                      )

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