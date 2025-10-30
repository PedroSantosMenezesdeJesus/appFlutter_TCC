import 'package:flutter/material.dart';
import 'package:flutter_rapportia/mapa_class.dart';

void mapaDescricaopag() {
  runApp(const MapaDescricaoPag());
}

class MapaDescricaoPag extends StatelessWidget {
  const MapaDescricaoPag({super.key});

  @override
  Widget build(BuildContext context) {

    final mapa = ModalRoute.of(context)!.settings.arguments as Mapa;

    final ScrollController controle = ScrollController();

    return Scaffold(

    //backgroundColor: Color.fromRGBO(241, 191, 39, 1),
      
      appBar: AppBar(
        centerTitle: true,
        title: Text(mapa.nome, style: TextStyle(fontFamily: 'Sunshiney', fontSize: 36, color:Color.fromRGBO(0, 0, 0, 1)), textAlign: TextAlign.center,),
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

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,

                children: [
                  /*
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(mapa.nome, style: TextStyle(fontFamily: 'Sunshiney', fontSize: 36, color:Color.fromRGBO(0, 0, 0, 1)), textAlign: TextAlign.center,),
                  ), */

                  Image.asset(mapa.imgDescricao, width: MediaQuery.of(context).size.width, height: 350, fit: BoxFit.cover, alignment: Alignment.center),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(mapa.descricao, style: TextStyle(fontFamily: 'Sunshiney', fontSize: 28, color:Color.fromRGBO(0, 0, 0, 1)),),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}