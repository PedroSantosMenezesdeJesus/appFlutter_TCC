import 'package:flutter/material.dart';
import 'package:flutter_rapportia/figurinha.dart';

void figurapag() {
  runApp(const FiguraPag());
}

class FiguraPag extends StatelessWidget{
  const FiguraPag({super.key});

  @override
  Widget build(BuildContext context) {

    final figurinha = ModalRoute.of(context)!.settings.arguments as Figurinha;

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
                    Padding(padding: EdgeInsets.all(8)),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          width: 2
                        )
                      ),
                      child: Image.asset(figurinha.figura, width: 300, height: 300, fit: BoxFit.cover,)
                    ),

                    Padding(padding: EdgeInsets.all(16)),

                    FilledButton(
                      onPressed: () => {}, 
                      child: Text("Baixar", style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontFamily: 'Sunshiney', fontSize: 24),)
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