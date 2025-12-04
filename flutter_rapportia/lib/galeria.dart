import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_rapportia/figurinha.dart';
import 'package:flutter_rapportia/figura_download.dart';

void galeriapag() {
  runApp(
    const MaterialApp( 
      title: "Galeria",
      home: GaleriaPag()
    )
  );
}

class GaleriaPag extends StatefulWidget{
  const GaleriaPag({super.key});

  @override
  GaleriaPAG createState() => GaleriaPAG();
}

class GaleriaPAG extends State{

  // cria uma lista vazia chamada de figurinha, usando a classe Figurinha
  List<Figurinha> figurinha = List.empty(growable: true);

  // função readJson que pega as informações do figuras.json, é decodificada e depois inserida na lista figurinha.
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/figuras.json');
      Iterable data = await json.decode(response);
    figurinha = List<Figurinha>.from(data.map((model) => Figurinha.fromJson(model)));

    setState(() {
      figurinha;
    });
  }

  @override
  void initState() {
    super.initState();
      readJson();
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      //backgroundColor: Color.fromRGBO(241, 191, 39, 1),
        
        /*appBar: AppBar(
          centerTitle: true,
          //backgroundColor: const Color.fromRGBO(29, 60, 124, 1),
          
        ),*/

      // SizesBox é necessario para o GriedView funcionar
      body:  SizedBox.expand(
        // cria um GriedView de duas colunas
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            childAspectRatio: 1,
          ),

          // quantidade de itens igual a quandidade de itens na lista de figurinha
          itemCount: figurinha.length,
          itemBuilder: (ctx, index) {
            
            return Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                  width: 2
                ),
                image: DecorationImage(
                  image: AssetImage(figurinha[index].figura),
                ),
              ),

              // ao toque usa um Navigator para levar a tela de Donwload de figurinhas
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const FiguraPag(),
                    settings: RouteSettings(
                      arguments: figurinha[index]
                    )
                  )
                ),
              ),

            );
            
          }
        ),
      )        
    );
  }
}
