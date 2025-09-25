import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_rapportia/figurinha.dart';
import 'package:flutter_rapportia/figuraDownload.dart';

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

  List<Figurinha> figurinha = List.empty(growable: true);

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
        
        appBar: AppBar(
          centerTitle: true,
          //backgroundColor: const Color.fromRGBO(29, 60, 124, 1),
          
        ),

      body:  SizedBox.expand(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            childAspectRatio: 1,
          ),
            
          itemCount: figurinha.length,
          itemBuilder: (ctx, index){
            
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